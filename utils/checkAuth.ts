import jwt from 'jsonwebtoken';

import { ApiError } from '@/handlers/apiError';

export const checkAuth = (token: string) => {
    if (!token) {
        throw ApiError.unauthorized('No authorization data');
    }
    try {
        const { id, role }: any = jwt.verify(token, process.env.JWT_TOKEN_SECRET_KEY!);

        return { id, role };
    } catch {
        throw ApiError.unauthorized('Authorization error');
    }
};
