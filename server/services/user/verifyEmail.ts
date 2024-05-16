import { db } from '@/libs/db';
import { ApiError } from '@/handlers/apiError';

export const verifyEmail = async ({ token }: { token: string }): Promise<{ status: Boolean }> => {
    if (!token) {
        throw ApiError.badRequest('Token is required');
    }
    try {
        const emailConfirm = await db.emailConfirm.findFirst({
            where: { token },
            include: {
                user: {
                    select: {
                        id: true,
                    },
                },
            },
        });
        if (!emailConfirm) {
            throw ApiError.badRequest('Invalid token');
        }
        if (emailConfirm.expiredAt && new Date(emailConfirm.expiredAt) < new Date()) {
            throw ApiError.badRequest('Token is expired');
        }
        if (emailConfirm.verified) return { status: true };
        await db.emailConfirm.update({
            where: { id: emailConfirm.id },
            data: {
                token: null,
                expiredAt: null,
                verified: true,
            },
        });
    } catch (error: any) {
        throw ApiError.badRequest(error.message || 'Email not verified');
    }
    return { status: true };
};
