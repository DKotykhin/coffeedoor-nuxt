import { db } from '@/libs/db';
import { ApiError } from '@/handlers/apiError';
import { StoreCategory, StoreItem, LanguageCode } from '@prisma/client';

export interface StoreCategoryFull extends StoreCategory {
    storeItems: StoreItem[];
}

export const getStore = async (language_code: LanguageCode): Promise<StoreCategoryFull[]> => {
    const store = await db.storeCategory.findMany({
        where: {
            language_code,
            hidden: false,
        },
        include: {
            storeItems: {
                where: {
                    language_code,
                    hidden: false,
                },
                orderBy: {
                    position: 'asc',
                },
            },
        },
        orderBy: {
            position: 'asc',
        },
    });

    if (!store) {
        throw ApiError.badRequest('Any store items not found');
    }

    return store;
};
