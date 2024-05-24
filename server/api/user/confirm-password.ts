import { H3Event } from 'h3';

import { confirmPassword } from '../../services/user/confirmPassword';

export default defineEventHandler(async (event: H3Event) => {
    const requestData = await readBody(event);
    const cookies = parseCookies(event);
    const token = cookies?.token;
    if (!token) {
        return null;
    }
    try {
        const data = await confirmPassword({ token, password: requestData.password });
        return { data };
    } catch (error: any) {
        return {
            error: {
                status: error.status,
                message: error.message,
            },
        };
    }
});
