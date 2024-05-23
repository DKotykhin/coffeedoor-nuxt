import crypto from 'crypto';

import { ApiError } from '@/handlers/apiError';

export const cryptoToken_16 = () => {
    const buffer = crypto.randomBytes(16);
    if (!buffer) throw ApiError.internalError('Something get wrong');
    const token = buffer.toString('hex');
    return token;
};

export const cryptoToken_2 = () => {
    const buffer = crypto.randomBytes(2);
    if (!buffer) throw ApiError.internalError('Something get wrong');
    const token = buffer.toString('hex');
    return token;
};
