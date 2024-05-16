import { H3Event } from 'h3';

import { resendEmail } from '../../services/user/resendEmail';

export default defineEventHandler(async (event: H3Event) => {
    const requestData = await readBody(event);
    try {
        const data = await resendEmail(requestData);
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