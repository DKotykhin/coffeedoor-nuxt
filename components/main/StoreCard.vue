<template>
    <UCard class='w-[350px]'>
        <NuxtImg :src="!!item.images[0] ? item.images[0] : '/logo-main.png'" :alt='item.title' :placeholder="[302, 302]"
            :class="['object-cover', 'rounded-xl', !!item.images[0] ? '' : 'p-16']" />
        <div class='flex flex-col gap-2 justify-between h-[250px] mt-2 p-2'>
            <p class='text-grey-800 text-xl'>{{ categoryTitle }} {{ item.title }}</p>
            <div class='flex gap-2'>
                <p v-if='item.oldPrice' class='text-grey-800 text-xl line-through'>
                    {{ item.oldPrice }} {{ $t('card.currency') }}
                </p>
                <p class='text-grey-800 text-xl font-medium'>{{ item.price }} {{ $t('card.currency') }}</p>
            </div>
            <p class='text-sm font-light text-grey'>{{ item.description }}</p>
            <div class='text-sm font-light text-grey'>
                <p v-if='item.toOrder' class='text-red'>{{ $t('card.isOrder') }}</p>
                <p>{{ $t('card.weight') }} {{ item.weight }} {{ $t('card.unit') }}</p>
                <p>{{ item.sortKey }}: {{ item.sortValue }}</p>
            </div>
        </div>
        <template #footer>
            <div class='flex flex-col min-[380px]:flex-row justify-center gap-3'>
                <UButton block size='lg' variant='outline' :to='localePath(`/details/${item.slug}`)'
                    class='w-full min-[380px]:max-w-[150px]'>
                    {{ $t('card.details') }}
                </UButton>
                <UButton block size='lg' @click='addToCard({ item, categoryTitle })'
                    class='w-full min-[380px]:max-w-[150px]'>
                    {{ $t('card.add') }}
                </UButton>
            </div>
        </template>
    </UCard>
</template>

<script setup lang="ts">
import type { StoreItem } from '@prisma/client';
import { useBasketStore } from '~/stores/basketStore';

const store = useBasketStore();
const localePath = useLocalePath();

defineProps({
    item: {
        type: Object as PropType<StoreItem>,
        required: true,
    },
    categoryTitle: {
        type: String,
        required: true,
    },
});

const addToCard = ({ item, categoryTitle }: { item: StoreItem, categoryTitle: string }) => {
    // console.log('Add to card', item);
    const { slug, title, price, weight, images } = item;
    store.addProductToBasket({
        slug,
        title,
        price,
        quantity: 1,
        weight,
        image: images[0],
        categoryTitle,
    })
};
</script>