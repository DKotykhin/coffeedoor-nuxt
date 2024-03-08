<template>
    <section class='w-full flex flex-col items-center px-4'>
        <div v-if="pending" class='flex flex-col justify-center items-center gap-2 h-[200px]'>
            <USkeleton class="h-8 w-[500px]" />
            <USkeleton class="h-8 w-[500px]" />
            <USkeleton class="h-8 w-[500px]" />
        </div>
        <div v-else class='w-full max-w-[700px] my-8 border border-grey-100 dark:border-grey-500 rounded-md shadow-md'>
            <UAccordion color="gray" variant="soft" size="lg" :items="items">
                <template #subItems="{ item }">
                    <div v-for='oneItem in item?.content' :key='oneItem.id' class="italic">
                        <div class='flex w-full justify-between px-4'>
                            <div className='flex flex-col mb-2'>
                                <p className='font-medium'>
                                    {{ oneItem.title }}
                                </p>
                                <p className='text-sm italic text-grey'>
                                    {{ oneItem.description }}
                                </p>
                            </div>
                            <p className='mb-2 whitespace-nowrap'>
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

const { locale } = useI18n();
const language_code = languageCode(locale.value);

const { data, pending } = await useAsyncData('menu', () => $fetch(`/api/menu?language_code=${language_code}`));
const items = computed(() => data.value?.map((category: any) => ({
    label: category.title,
    slot: 'subItems',
    content: category.menuItems.length ? category.menuItems.map((subItem: MenuItem) => ({
        id: subItem.id,
        title: subItem.title,
        price: subItem.price,
        description: subItem.description,
        language_code: subItem.language_code,
    })) : null,
})));
</script>
