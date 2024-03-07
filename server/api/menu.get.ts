import type { Menu } from '~/types/menu';

export default defineEventHandler(async (event) => {
    const menu: Menu[] = [
        {
            id: 1,
            label: 'Кавові напої',
            items: [
                {
                    id: 1,
                    itemName: 'Еспресо',
                    description: '',
                    price: 35,
                },
                {
                    id: 2,
                    itemName: 'Американо',
                    description: '',
                    price: 40,
                },
                {
                    id: 3,
                    itemName: 'Капучіно',
                    description: '',
                    price: 45,
                },
            ],
        },
        {
            id: 2,
            label: 'Чаї',
            items: [
                {
                    id: 4,
                    itemName: 'Зелений чай',
                    description: '',
                    price: 35,
                },
                {
                    id: 5,
                    itemName: 'Чорний чай',
                    description: '',
                    price: 40,
                },
                {
                    id: 6,
                    itemName: 'Фруктовий чай',
                    description: '',
                    price: 45,
                },
            ],
        },
        {
            id: 3,
            label: 'Солодощі',
            items: [
                {
                    id: 7,
                    itemName: 'Тірамісу',
                    description: '',
                    price: 65,
                },
                {
                    id: 8,
                    itemName: 'Чізкейк',
                    description: '',
                    price: 75,
                },
                {
                    id: 9,
                    itemName: 'Шоколадний торт',
                    description: '',
                    price: 85,
                },
            ],
        },
    ];

    return {
        body: menu,
    };
});
