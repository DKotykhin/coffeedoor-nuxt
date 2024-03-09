import { H3Event } from 'h3';
import { LanguageCode } from '@prisma/client';

import { getStore } from '../services/store/getStore';

export default defineEventHandler(async (event: H3Event) => {
    const query = getQuery(event);

    return await getStore((query.language_code as LanguageCode) || LanguageCode.EN);
});
