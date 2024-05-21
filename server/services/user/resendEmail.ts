import { db } from '@/libs/db';
import { ApiError } from '@/handlers/apiError';
import { cryptoToken, findUserByEmail, mailSender } from '~/utils/_index';

export const resendEmail = async ({ email }: { email: string }): Promise<{ status: Boolean }> => {
    const user = await findUserByEmail(email);
    if (!user) {
        throw ApiError.notFound('User not found');
    }
    if (user.emailConfirm?.verified) {
        throw ApiError.badRequest('Email already confirmed');
    }
    if (user.emailConfirm?.expiredAt && new Date(user.emailConfirm.expiredAt) < new Date()) {
        const token = cryptoToken();
        await mailSender({
            to: email,
            subject: 'Verify Email',
            html: `
                    <h2>Please, follow the link to confirm your email</h2>
                    <h4>The link will expire within <strong>1 hour</strong></h4>
                    <h4>If you don't try to login or register, ignore this mail</h4>
                    <hr/>
                    <br/>
                    <a href='${process.env.FRONTEND_URL}auth/confirm-email/${token}'>Link for email confirmation</a>
                `,
        });
        await db.emailConfirm.update({
            where: { id: user.emailConfirm.id },
            data: {
                token,
                expiredAt: new Date(Date.now() + 1000 * 60 * 60),
            },
        });
    } else {
        await mailSender({
            to: email,
            subject: 'Verify Email',
            html: `
                    <h2>Please, follow the link to confirm your email</h2>
                    <h4>!Repeated message!</h4>
                    <h4>If you don't try to login or register, ignore this mail</h4>
                    <hr/>
                    <br/>
                    <a href='${process.env.FRONTEND_URL}/auth/confirm-email/${user.emailConfirm?.token}'>Link for email confirmation</a>
                `,
        });
    }
    return {
        status: true,
    };
};
