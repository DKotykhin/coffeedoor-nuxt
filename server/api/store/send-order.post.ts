import { H3Event } from 'h3';

import { sendOrder } from '../../services/store/sendOrder';

export default defineEventHandler(async (event: H3Event) => {
    const orderData = await readBody(event);

    return await sendOrder(orderData);
});