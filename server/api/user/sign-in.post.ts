import { H3Event } from 'h3';

import { signIn } from '../../services/user/signIn';

export default defineEventHandler(async (event: H3Event) => {
    const requestData = await readBody(event);
    try {
        const data = await signIn(requestData);
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
