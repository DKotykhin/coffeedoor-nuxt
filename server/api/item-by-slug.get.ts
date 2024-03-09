import { H3Event } from 'h3';

import { getItemBySlug } from '../services/store/getItemBySlug';

export default defineEventHandler(async (event: H3Event) => {
    const query = getQuery(event);

    return await getItemBySlug(query.slug as string);
});
