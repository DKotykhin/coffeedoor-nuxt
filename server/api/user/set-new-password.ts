import { H3Event } from 'h3';

import { setNewPassword } from '../../services/user/setNewPassword';

export default defineEventHandler(async (event: H3Event) => {
    const requestData = await readBody(event);
    const query = getQuery(event);
    try {
        const data = await setNewPassword({
            token: query.token as string,
            password: requestData.password
        
        });
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