<template>
    <block-wrapper>
        <div v-if="pending">
            <TheSkeleton />
        </div>
        <div v-else class='flex flex-col items-center max-w-[1114px] mb-6'>
            <div v-for='category in categories' :key='category.id' :id='category.position.toString()'>
                <div class='px-2 md:px-4 py-4 text-center'>
                    <h3 class='text-3xl md:text-4xl font-medium mb-3 md:mb-6 uppercase'>
                        {{ category.title }}
                    </h3>
                    <h4 class='text-lg md:text-2xl'>
                        {{ category.subtitle }}
                    </h4>
                </div>
                <MainStoreItemList :items='(category?.storeItems as unknown as StoreItem[])' :categoryTitle='category.title' />
            </div>
        </div>
    </block-wrapper>
</template>

<script setup lang="ts">
import { languageCode } from '@/libs/languageCode';
import type { StoreItem } from '@prisma/client';

const { locale } = useI18n();
const language_code = languageCode(locale.value);

const { data: categories, pending } = await useAsyncData('store', () => $fetch(`/api/store/store?language_code=${language_code}`));
</script>
