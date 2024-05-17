import { H3Event } from 'h3';

import { resetPassword } from '../../services/user/resetPassword';

export default defineEventHandler(async (event: H3Event) => {
    const requestData = await readBody(event);
    try {
        const data = await resetPassword(requestData);
        return { data };
    } catch (error: any) {
        return {
            error: {
                status: error.status,
                message: error.message
            }
        };
    }
});