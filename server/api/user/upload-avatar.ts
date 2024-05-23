import { H3Event, parseCookies, readMultipartFormData } from 'h3';

import { uploadAvatar } from '../../services/user/uploadAvatar';

export default defineEventHandler(async (event: H3Event) => {
    const cookies = parseCookies(event);
    const token = cookies?.token;
    if (!token) {
        return null;
    }
    const formData = await readMultipartFormData(event);
    try {
        const data = await uploadAvatar(formData, token);
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