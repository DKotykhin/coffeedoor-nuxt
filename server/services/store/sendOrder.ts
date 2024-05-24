import axios from 'axios';

import { db } from '@/libs/db';
import { ApiError } from '@/handlers/apiError';
import { BasketFormTypes } from '@/validation/basketValidation';
import { IBasket } from '@/stores/basketStore';
import { mailSender } from '~/utils/_index';

export interface OrderDataProps {
    userFormData: BasketFormTypes;
    basketData: IBasket[];
    userId: string;
}

export const sendOrder = async (orderData: OrderDataProps): Promise<{ status: Boolean }> => {
    const {
        userFormData: { userName, phone, deliveryWay, comment },
        basketData,
        userId,
    } = orderData;

    const TOKEN = process.env.TELEGRAM_TOKEN;
    const CHAT_ID = process.env.TELEGRAM_CHAT_ID;
    if (!TOKEN) {
        throw ApiError.notFound('Define TELEGRAM_TOKEN environmental variable');
    }
    if (!CHAT_ID) {
        throw ApiError.notFound('Define CHAT_ID environmental variable');
    }

    const URL = `https://api.telegram.org/bot${TOKEN}/sendMessage`;

    let message = `<b>--- Заявка з сайту ---</b>\n`;
    message += `<b>Відправник: </b>${userName}\n`;
    message += `<b>Телефон: </b>+${phone}\n`;
    message += `<b>Спосіб доставки: </b>${deliveryWay}\n`;
    message += `<b>Коментар: </b>${comment ? comment : ''}\n`;
    message += `<b>Замовлення: </b>\n`;

    let orderQuantity = 0;
    let orderSum = 0;

    basketData.forEach((item) => {
        message += `${item.categoryTitle} ${item.title}, ${item.weight ? `${item.weight}г,` : ''} ${
            item.quantity
        } x ${item.price} грн\n`;
        orderQuantity += item.quantity;
        orderSum += +item.price * item.quantity;
    });
    message += `<b>Загалом позицій: </b>${orderQuantity}\n`;
    message += `<b>Всього на суму: </b>${orderSum} грн`;

    const averageSum = Math.round(orderSum / orderQuantity);

    let emailMessage = `<b>--- Заявка з сайту ---</b><br/>`;
    emailMessage += `<b>Відправник: </b>${userName}<br/>`;
    emailMessage += `<b>Телефон: </b>+${phone}<br/>`;
    emailMessage += `<b>Спосіб доставки: </b>${deliveryWay}<br/>`;
    emailMessage += `<b>Коментар: </b>${comment ? comment : ''}<br/>`;
    emailMessage += `<b>Замовлення: </b><br/>`;

    basketData.forEach((item) => {
        emailMessage += `${item.categoryTitle} ${item.title}, ${item.weight ? `${item.weight}г,` : ''} ${
            item.quantity
        } x ${item.price} грн<br/>`;
    });
    emailMessage += `<b>Загалом позицій: </b>${orderQuantity}<br/>`;
    emailMessage += `<b>Всього на суму: </b>${orderSum} грн`;

    try {        
        await axios.post(URL, {
            chat_id: CHAT_ID,
            parse_mode: 'html',
            text: message,
        });
    
        const user = await db.user.findUnique({
            where: { id: userId },
            include: {
                emailConfirm: {
                    select: {
                        verified: true,
                    },
                },
            },
        });
        if (user?.emailConfirm?.verified) {
            await mailSender({
                to: user.email,
                subject: 'New order',
                html: `
                    ${emailMessage}
                    <hr/>
                    <br/>
                    <a href='${process.env.FRONTEND_URL}'>CoffeeDoor online shop</a>
                `,
            });
        };
    } catch (error) {
        throw ApiError.badRequest('Order can not be sent') 
    }

    try {
        const order = await db.userOrder.create({
            data: {
                deliveryWay,
                comment,
                totalSum: orderSum,
                totalQuantity: orderQuantity,
                averageSum,
                userId,
            },
        });
        if (!order?.id) {
            throw ApiError.badRequest("User order can't be created");
        }
        const transaction = basketData.map((item) => {
            const { categoryTitle, title, weight, price, quantity, slug } = item;
            return db.orderItem.create({
                data: {
                    categoryTitle,
                    itemTitle: title,
                    quantity,
                    price,
                    weight,
                    slug,
                    userOrderId: order.id,
                },
            });
        });
        await db.$transaction(transaction);
    } catch (error) {
        throw ApiError.badRequest("Order items can't be created");
    }

    return { status: true };
};
