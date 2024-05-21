import { db } from '@/libs/db';
import { ApiError } from '@/handlers/apiError';
import { StoreItem } from '@prisma/client';

export interface StoreItemBySlugProps {
    categoryTitle?: string;
    storeItem: StoreItem;
    recommendationList?: StoreItem[];
}

export const getItemBySlug = async (slug: string): Promise<StoreItemBySlugProps> => {
    if (!slug) {
        throw ApiError.badRequest('Slug is empty');
    }
    const storeItem = await db.storeItem.findUnique({
        where: { slug },
    });
    if (!storeItem) {
        throw ApiError.badRequest('Any store items not found');
    }

    const storeCategory = await db.storeCategory.findUnique({
        where: {
            id: storeItem?.storeCategoryId,
        },
        include: {
            storeItems: {
                where: {
                    hidden: false,
                },
            },
        },
    });
    if (!storeCategory) {
        throw ApiError.badRequest('Any store categories not found');
    }
    
    const copyArr = storeCategory?.storeItems?.slice();
    const itemIndex = copyArr.findIndex((item) => item.slug === storeItem.slug);
    copyArr.splice(itemIndex, 1);
    const recommendationList = [];
    const n = 2;
    if (n < copyArr.length) {
        for (let i = 0; i < n; i++) {
            const randomIndex = Math.floor(Math.random() * copyArr.length);
            recommendationList.push(copyArr[randomIndex]);
            copyArr.splice(randomIndex, 1);
        }
    } else {
        recommendationList.push(...copyArr);
    }

    return {
        storeItem,
        categoryTitle: storeCategory?.title,
        recommendationList,
    };
};
