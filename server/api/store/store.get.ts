import { H3Event } from 'h3';
import { LanguageCode } from '@prisma/client';

import { getStore } from '../../services/store/getStore';

export default defineEventHandler(async (event: H3Event) => {
    const query = getQuery(event);

    try {
        return await getStore((query.language_code as LanguageCode) || LanguageCode.EN);
    } catch (error) {
        console.error(error);
        return null;
    }
});
