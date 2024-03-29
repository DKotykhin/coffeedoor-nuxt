import { H3Event, parseCookies } from 'h3';

import { getUserByToken } from '../../services/user/getUserByToken';

export default defineEventHandler(async (event: H3Event) => {
    const cookies = parseCookies(event);
    const token = cookies?.token;
    if (!token) {
        return null;
    }

    return await getUserByToken(token);
});
