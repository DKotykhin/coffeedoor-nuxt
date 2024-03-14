import { User } from '@prisma/client';
import { ApiError } from '@/handlers/apiError';
import { SignInTypes, signInValidate } from '@/validation/userValidation';
import { findUserByEmail } from '~/utils/findUser';
import { PasswordHash } from '~/utils/passwordHash';
import { jwtToken } from '~/utils/jwtToken';

export const signIn = async (data: SignInTypes): Promise<{ user: User; token: string }> => {
    const { email, password } = await signInValidate(data);

    const user = await findUserByEmail(email);
    if (!user) {
        throw ApiError.badRequest('Incorrect login or password');
    }

    if (user?.passwordHash === null) {
        throw ApiError.badRequest('Incorrect login or password');
    }
    await PasswordHash.compare(password, user.passwordHash, 'Incorrect login or password');

    const token = jwtToken(user.id, user.role);
    const { userName, id, role, createdAt, address, phone, avatar } = user;

    return {
        user: {
            id,
            userName,
            email,
            role,
            createdAt,
            address,
            phone,
            avatar,
            passwordHash: null,
        },
        token,
    };
};
