import { db } from '@/libs/db';

import { ApiError } from '@/handlers/apiError';
import { LanguageCode, MenuCategory, MenuItem } from '@prisma/client';

export interface MenuCategoryFull extends MenuCategory {
    menuItems: MenuItem[];
}

export const getMenu = async (language_code: LanguageCode): Promise<MenuCategoryFull[]> => {
    try {
        const menu = await db.menuCategory.findMany({
            where: {
                language_code,
                hidden: false,
            },
            include: {
                menuItems: {
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

        return menu;
    } catch (error) {
        throw ApiError.badRequest('Menu not found');
    }
};
