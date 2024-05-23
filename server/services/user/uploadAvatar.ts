import { db } from '@/libs/db';
import cloudinary from '@/libs/cloudinary';

import { User } from '@prisma/client';
import { ApiError } from '@/handlers/apiError';
import { checkAuth, cryptoToken_2, findUserById } from '~/utils/_index';

export const uploadAvatar = async (files: any, token: string): Promise<User> => {
    const { id } = checkAuth(token);
    const file = files[0];

    if (!file) {
        throw ApiError.badRequest('No file uploaded.');
    }
    const buffer = Buffer.from(file.data);
    const uploadData = 'data:image/png;base64,' + buffer.toString('base64');

    if (!file.type?.startsWith('image')) {
        throw ApiError.badRequest('Incorrect file type.');
    };

    const cryptoToken = cryptoToken_2();

    const result = await cloudinary.uploader.upload(
        uploadData,
        {
            folder: 'avatars',
            resource_type: 'image',
            transformation: [{ width: 100, height: 100, crop: 'fill', fetch_format: 'auto' }],
            public_id: id + '-' + cryptoToken,
            overwrite: true,
        },
        (error, result) => {
            if (error) {
                console.error(error);
                throw ApiError.badRequest("Can't upload avatar");
            }
            return result;
        }
    );
    const user = await findUserById(id);
    if (!user) {
        throw ApiError.badRequest('User not found');
    };
    if (user.avatar) {
        await cloudinary.uploader.destroy(user.avatar, (error, result) => {
            if (error) {
                console.error(error);
                throw ApiError.badRequest("Can't upload avatar");
            }
            return result;
        });
    }
    try {
        const user = await db.user.update({
            where: { id },
            data: { avatar: result.public_id },
        });
        return {
            ...user,
            passwordHash: null,
        
        };
    } catch (error) {
        console.error(error);
        throw ApiError.internalError('Error updating avatar');
    }
};
