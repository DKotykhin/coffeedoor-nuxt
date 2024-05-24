import { ApiError } from '~/handlers/apiError';
import { PasswordHash, checkAuth, findUserById } from '~/utils/_index';

export const confirmPassword = async ({
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
    await PasswordHash.compare(password, user.passwordHash, 'Password not match');
    return {
        status: true,
    };
};
