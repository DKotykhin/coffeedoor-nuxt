import { db } from '@/libs/db';
import { ApiError } from '@/handlers/apiError';
import { cryptoToken, findUserByEmail, mailSender } from '@/utils/_index';
import { emailValidate } from '@/validation/userValidation';

export const resetPassword = async ({ email }: { email: string }): Promise<{ status: Boolean }> => {
    await emailValidate({ email });
    const user = await findUserByEmail(email);
    if (!user?.id) {
        throw ApiError.notFound('User not found');
    }

    if (!user?.emailConfirm?.verified) {
        throw ApiError.badRequest('Email not verified. Check your email');
    }

    const token = cryptoToken();
    await mailSender({
        to: email,
        subject: 'Reset Password',
        html: `
                <h2>Please, follow the link to set new password</h2>
                <h4>The link will expire within <strong>1 hour</strong></h4>
                <h4>If you don't restore your password ignore this mail</h4>
                <hr/>
                <br/>
                <a href='${process.env.FRONTEND_URL}/auth/set-new-password/${token}'>Link for email confirmation</a>
            `,
    });

    try {
        await db.resetPassword.upsert({
            where: { userId: user.id },
            create: {
                userId: user.id,
                token,
                expiredAt: new Date(Date.now() + 1000 * 60 * 60),
            },
            update: {
                token,
                expiredAt: new Date(Date.now() + 1000 * 60 * 60),
            },
        });
    } catch (error) {
        throw ApiError.badRequest("Can't reset password");
    }

    return { status: true };
};