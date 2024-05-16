import { db } from '@/libs/db';
import { ApiError } from '@/handlers/apiError';
import { OrderItem, UserOrder } from '@prisma/client';
import { checkAuth } from '~/utils/_index';

export interface UserOrdersFull extends UserOrder {
    orderItems: OrderItem[];
}

export interface UserOrdersProps {
    orders: UserOrdersFull[];
    totalCount: number;
    totalPages: number;
}

export const getUserOrders = async ({
    limit,
    page,
    token,
}: {
    limit: number | null;
    page: number | null;
    token: string | null;
}): Promise<UserOrdersProps> => {
    if (!token) {
        throw ApiError.badRequest('Token is required');
    }
    const validPage = page ? page : 1;
    const validLimit = limit ? limit : 5;
    const { id: userId } = checkAuth(token);
    try {
        const orders = await db.userOrder.findMany({
            where: {
                userId,
            },
            orderBy: {
                createdAt: 'desc',
            },
            skip: (validPage - 1) * validLimit,
            take: validLimit,
            include: {
                orderItems: true,
            },
        });
        const totalCount = await db.userOrder.count({
            where: {
                userId,
            },
        });
        const totalPages = Math.ceil(totalCount / validLimit);

        return { orders, totalCount, totalPages };
    } catch (error) {
        throw ApiError.badRequest('Orders not found');
    }
};
