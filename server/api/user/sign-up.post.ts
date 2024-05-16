import { H3Event } from 'h3';

import { signUp } from '../../services/user/signUp';

export default defineEventHandler(async (event: H3Event) => {
    const requestData = await readBody(event);
    try {
        const data = await signUp(requestData);
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