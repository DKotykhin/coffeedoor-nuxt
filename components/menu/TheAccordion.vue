<template>
    <section class='w-full flex flex-col items-center px-4'>
        <div v-if="pending">
            <TheSkeleton />
        </div>
        <div v-else class='w-full max-w-[700px] my-8 border border-grey-100 dark:border-grey-500 rounded-md shadow-md'>
            <UAccordion color="gray" variant="soft" size="lg" :items="(items as any)">
                <template #subItems="{ item }">
                    <div v-for='oneItem in item?.content' :key='oneItem.id'>
                        <div class='flex w-full justify-between px-4'>
                            <div class='flex flex-col mb-2'>
                                <p class='font-medium text-grey-800 dark:text-grey-200'>
                                    {{ oneItem.title }}
                                </p>
                                <p class='text-sm italic text-grey'>
                                    {{ oneItem.description }}
                                </p>
                            </div>
                            <p class='mb-2 whitespace-nowrap text-grey-800 dark:text-grey-200'>
                                {{ oneItem.price }} {{ oneItem.language_code === LanguageCode.UA ? ' грн' : ' uah' }}
                            </p>
                        </div>
                    </div>
                </template>
            </UAccordion>
        </div>
    </section>
</template>

<script setup lang="ts">
import { type MenuItem, LanguageCode } from '@prisma/client';
import { languageCode } from '@/libs/languageCode';
import type { MenuCategoryFull } from '~/server/services/menu/getMenu';

const { locale } = useI18n();
const language_code = languageCode(locale.value);

const { data, pending }: any = await useAsyncData('menu', () => $fetch(`/api/menu?language_code=${language_code}`));
const items = computed(() => data.value?.map((category: MenuCategoryFull) => ({
    label: category.title,
    slot: 'subItems',
    content: category.menuItems.length ? category.menuItems.map((subItem: MenuItem) => ({
        id: subItem.id,
        title: subItem.title,
        price: subItem.price,
        description: subItem.description,
        language_code: subItem.language_code,
    })) : null,
    defaultOpen: category.position === 1,
})));
</script>
