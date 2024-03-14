import { User } from '@prisma/client';
import { ApiError } from '@/handlers/apiError';
import { checkAuth } from '~/utils/checkAuth';
import { findUserById } from '~/utils/findUser';

export const getUserByToken = async (token: string): Promise<User> => {
    if (!token) {
        throw ApiError.badRequest('Token is required');
    }
    const { id } = checkAuth(token);

    const user = await findUserById(id);

    if (!user) {
        throw ApiError.badRequest('Invalid token');
    }
    const { passwordHash, ...rest } = user;

    return { ...rest, passwordHash: null };
};
