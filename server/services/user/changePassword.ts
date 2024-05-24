import { db } from '@/libs/db';
import { ApiError } from '~/handlers/apiError';
import { PasswordHash, checkAuth, findUserById } from '~/utils/_index';

export const changePassword = async ({
    token,
    password,
}: {
    token: string;
    password: string;
}): Promise<{ status: boolean }> => {
    if (!password) {
        throw ApiError.badRequest('Password is required');
    }
    const { id } = checkAuth(token);
    const user = await findUserById(id);
    if (!user) {
        throw ApiError.badRequest('User not found');
    }
    if (!user.passwordHash) {
        throw ApiError.badRequest('Password not set');
    }
    await PasswordHash.same(password, user.passwordHash, 'The same password!');
    const passwordHash = await PasswordHash.create(password);
    await db.user.update({
        where: {
            id,
        },
        data: {
            passwordHash,
        },
    });
    return {
        status: true,
    };
};
