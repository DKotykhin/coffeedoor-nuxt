import { User } from '@prisma/client';

import { ApiError } from '@/handlers/apiError';
import { SignInTypes, signInValidate } from '@/validation/userValidation';
import { jwtToken, PasswordHash, findUserByEmail } from '~/utils/_index';

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

    return {
        user: {
            ...user,
            passwordHash: null,
        },
        token,
    };
};
