import { db } from '@/libs/db';
import { User } from '@prisma/client';
import { ApiError } from '~/handlers/apiError';
import { checkAuth, findUserById } from '~/utils/_index';

export const updateUser = async ({
    token,
    data,
}: {
    token: string;
    data: {
        userName: string;
        phone: string;
        address: string;
    };
}): Promise<User> => {
    if (!data) {
        throw ApiError.badRequest('Data is required');
    }
    const { id } = checkAuth(token);
    const user = await findUserById(id);
    if (!user) {
        throw ApiError.badRequest('User not found');
    }
    const updatedUser = await db.user.update({
        where: { id },
        data,
    });
    return {
        ...updatedUser,
        passwordHash: null,
    };
};
