import { H3Event } from 'h3';

import { getUserByToken } from '../../services/user/getUserByToken';

export default defineEventHandler(async (event: H3Event) => {
    const query = getQuery(event);

    return await getUserByToken(query?.token as string || '');
});