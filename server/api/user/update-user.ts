import { H3Event } from 'h3';

import { updateUser } from '../../services/user/updateUser';

export default defineEventHandler(async (event: H3Event) => {
    const requestData = await readBody(event);
    const cookies = parseCookies(event);
    const token = cookies?.token;
    if (!token) {
        return null;
    }
    try {
        const data = await updateUser({ token, data: requestData });
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