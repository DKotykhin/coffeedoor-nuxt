import { H3Event } from 'h3';

import { changePassword } from '../../services/user/changePassword';

export default defineEventHandler(async (event: H3Event) => {
    const requestData = await readBody(event);
    const cookies = parseCookies(event);
    const token = cookies?.token;
    if (!token) {
        return null;
    }
    try {
        const data = await changePassword({ token, password: requestData.password });
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
