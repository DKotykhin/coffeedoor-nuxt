import { User } from '@prisma/client';
import { db } from '@/libs/db';
import { ApiError } from '@/handlers/apiError';
import { cryptoToken, findUserByEmail, mailSender, PasswordHash } from '@/utils/_index';
import { SignUpTypes, signUpValidate } from '@/validation/userValidation';

export const signUp = async (signUpData: SignUpTypes): Promise<{ user: User }> => {
    await signUpValidate(signUpData);
    const { email, password, userName } = signUpData;
    const candidate = await findUserByEmail(email);
    if (candidate?.id) {
        throw ApiError.badRequest(`User ${email} already exist`);
    }
    const passwordHash = await PasswordHash.create(password);
    const token = cryptoToken();

    const user = await db.user.create({
        data: {
            email,
            userName,
            passwordHash,
            emailConfirm: {
                create: {
                    token,
                    expiredAt: new Date(Date.now() + 1000 * 60 * 60),
                },
            },
        },
    });
    if (!user?.id) {
        throw ApiError.internalError('Database error');
    }
    await mailSender({
        to: email,
        subject: 'Verify Email',
        html: `
                <h2>Please, follow the link to confirm your email</h2>
                <h4>If you don't try to login or register, ignore this mail</h4>
                <hr/>
                <br/>
                <a href='${process.env.FRONTEND_URL}/auth/confirm-email/${token}'>Link for email confirmation</a>
            `,
    });

    return {
        user: {
            ...user,
            passwordHash: null,
        },
    };
};
