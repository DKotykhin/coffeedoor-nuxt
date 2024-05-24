import { H3Event, parseCookies } from 'h3';

import { getUserOrders } from '../../services/user/getUserOrders';

export default defineEventHandler(async (event: H3Event) => {
    const query = getQuery(event);
    const cookies = parseCookies(event);
    const token = cookies?.token;
    if (!token) {
        return null;
    }
    try {
    return await getUserOrders({
        limit: query.limit ? parseInt(query.limit.toString()) : null,
        page: query.page ? parseInt(query.page.toString()) : null,
        token,
    });
    } catch (error) {
        console.error(error);
        return null;
    }
});
