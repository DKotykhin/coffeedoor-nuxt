import { H3Event } from 'h3';

import { signIn } from '../../services/user/signIn';

export default defineEventHandler(async (event: H3Event) => {
    const data: { email: string; password: string; } = await readBody(event);

    return await signIn(data);
});
