import { db } from '@/libs/db';
import { ApiError } from '@/handlers/apiError';
import { PasswordHash } from '@/utils/_index';
import { passwordValidate } from '@/validation/userValidation';

export const setNewPassword = async ({
    token,
    password,
}: {
    token: string;
    password: string;
}): Promise<{ status: Boolean }> => {
    if (!token || !password) {
        throw ApiError.badRequest('Invalid data');
    }
    await passwordValidate({ password });

    const pass = await db.resetPassword.findFirst({
        where: { token, expiredAt: { gt: new Date() } },
        include: {
            user: {
                select: {
                    id: true,
                    emailConfirm: {
                        select: {
                            verified: true,
                        },
                    },
                },
            },
        },
    });
    if (!pass?.id) {
        throw ApiError.badRequest('Invalid token');
    }
    if (!pass?.user?.emailConfirm?.verified) {
        throw ApiError.badRequest('Email not verified');
    }
    const passwordHash = await PasswordHash.create(password);
    try {
        await db.$transaction([
            db.resetPassword.update({
                where: { id: pass.id },
                data: {
                    token: null,
                    expiredAt: null,
                    changedAt: new Date(),
                },
            }),
            db.user.update({
                where: { id: pass.user.id },
                data: {
                    passwordHash,
                },
            }),
        ]);
    } catch (error) {
        throw ApiError.badRequest("Password can't be changed");
    }

    return { status: true };
};