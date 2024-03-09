import { H3Event } from 'h3';
import { LanguageCode } from '@prisma/client';

import { getMenu } from '../services/menu/getMenu';

export default defineEventHandler(async (event: H3Event) => {
    const query = getQuery(event);

    return await getMenu((query.language_code as LanguageCode) || LanguageCode.EN);
});
