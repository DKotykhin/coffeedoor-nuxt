import { H3Event } from 'h3';

import { getItemBySlug } from '../../services/store/getItemBySlug';

export default defineEventHandler(async (event: H3Event) => {
    const query = getQuery(event);

    try {
        return await getItemBySlug(query.slug as string);
    } catch (error) {
        console.error(error);
        return null;
    }
});
