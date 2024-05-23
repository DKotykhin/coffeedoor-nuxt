<template>
    <div>
        <UButton :to="localePath('/')" variant='ghost' class='p-0 mt-1'>
            <Icon name="i-mdi-arrow-left" size='30' />
        </UButton>
        <div class='w-full flex flex-col items-center'>
            <h2 className='text-2xl md:text-4xl font-medium text-grey-800 dark:text-grey-200 mb-4 md:mb-8'>
                {{ $t('card.details') }}
            </h2>
            <div class='w-full flex flex-col md:flex-row gap-2 md:gap-10 md:items-center'>
                <DetailsItemPhoto :images="data?.storeItem.images" />
                <div class='max-w-[500px]'>
                    <h3 class='text-xl md:text-2xl font-medium text-grey-800 dark:text-grey-200 mb-4'>
                        {{ data?.categoryTitle }} {{ data?.storeItem.title }}
                    </h3>
                    <p class='text-2xl font-medium text-grey-800 dark:text-grey-200 mb-4'>
                        {{ data?.storeItem.price }}{{ $t('card.currency') }}
                    </p>
                    <div class='text-grey-600 text-sm mb-2'>
                        <p>{{ data?.storeItem.sortKey }}: {{ data?.storeItem.sortValue }}</p>
                        <p>{{ $t('card.weight') }}{{ data?.storeItem.weight }}{{ $t('card.unit') }}</p>
                        <p>{{ data?.storeItem.tm }}</p>
                        <p>{{ $t('card.country') }}{{ data?.storeItem.country }}</p>
                    </div>
                    <div class='text-grey-600 text-sm italic'>
                        <p>{{ data?.storeItem.description }}</p>
                        <p>{{ data?.storeItem.details }}</p>
                    </div>
                    <div class='flex items-center gap-2 mt-4'>
                        <UButton @click='decrement' variant='ghost'>
                            <Icon name="i-mdi-minus" size='30' />
                        </UButton>
                        <span class='text-lg'>{{ quantity }}</span>
                        <UButton @click='increment' variant='ghost'>
                            <Icon name="i-mdi-plus" size='30' />
                        </UButton>
                    </div>
                    <UButton block size='lg'
                        @click='addToCard({ item: data?.storeItem as StoreItem, categoryTitle: data?.categoryTitle as string })'
                        class='w-full max-w-[250px] mt-4'>
                        {{ $t('card.add') }}
                    </UButton>
                </div>
            </div>
            <div class='w-full flex flex-col items-center my-8'>
                <p class='text-xl mb-4'>{{ $t('card.recommendation') }}</p>
                <div class='flex flex-col md:flex-row gap-4'>
                    <MainStoreCard v-for='item in data?.recommendationList' :key='item.slug' :item='item'
                        :categoryTitle='data?.categoryTitle || ""' :showDetails='false' />
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import type { StoreItemBySlugProps } from '~/server/services/store/getItemBySlug';
import type { StoreItem } from '@prisma/client';

const store = useBasketStore();
const localePath = useLocalePath();
const quantity = ref(1);

defineProps({
    data: Object as PropType<StoreItemBySlugProps>,
});

const increment = () => {
    quantity.value += 1;
};
const decrement = () => {
    if (quantity.value > 1) {
        quantity.value -= 1;
    }
};

const addToCard = ({ item, categoryTitle }: { item: StoreItem, categoryTitle: string }) => {
    const { slug, title, price, weight, images } = item;
    store.addProductToBasket({
        slug,
        title,
        price,
        quantity: quantity.value,
        weight,
        image: images[0],
        categoryTitle,
    })
};
</script>