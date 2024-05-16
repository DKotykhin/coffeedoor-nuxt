import { H3Event } from 'h3';

import { verifyEmail } from '../../services/user/verifyEmail';

export default defineEventHandler(async (event: H3Event) => {
    const query = getQuery(event);
    try {
        const data = await verifyEmail({ token: query.token as string });
        return {
            data
        };
    } catch (error: any) {
        return {
            error: {
                status: error.status,
                message: error.message
            }
        };
    }
});
