<template>
    <block-wrapper>
        <h1 class='text-2xl mb-4 font-medium'>{{ $t('basket.title') }}</h1>
        <div v-if='basket.length'>
            <div v-for="(item, index) in basket" :key="item.slug" class='w-full flex flex-col items-center gap-2 md:px-6'>
                <div class='max-w-[800px] w-full flex flex-col gap-2'>
                    <div class='flex justify-between gap-4'>
                        <div class='flex items-center gap-4 mt-1'>
                            <p>{{ index + 1 }}</p>
                            <NuxtImg :src="item.image" :alt="item.title" width="70" height="70" class='rounded-md' />
                            <div class='flex flex-col gap-1 md:ml-2'>
                                <p>
                                    {{ item.categoryTitle }} {{ item.title }}, {{ item.weight ? item.weight +
                                        $t('basket.weight') : "" }}
                                </p>
                            </div>
                        </div>
                        <UButton @click='store.removeItem(item.slug)' icon="i-heroicons-x-mark" size="sm" color="red" square
                            variant="ghost" />
                    </div>
                    <div class='flex items-center justify-end gap-2'>
                        <button class='flex justify-center items-center text-white bg-mint w-5 h-5 rounded-full'
                            @click='store.quantityDec(item.slug)'>
                            &#8211;
                        </button>
                        <p>{{ item.quantity }}</p>
                        <button class='flex justify-center items-center text-white bg-mint w-5 h-5 rounded-full'
                            @click='store.quantityInc(item.slug)'>
                            +
                        </button>
                        <p>x</p>
                        <p>{{ item.price }} {{ $t("basket.currency") }}</p>
                        <p>=</p>
                        <p>{{ item.quantity * item.price }} {{ $t("basket.currency") }}</p>
                    </div>
                    <UDivider class='py-2' />
                </div>
            </div>
            <div class='text-lg font-medium max-w-[800px] w-full flex justify-end mt-2'>
                {{ $t('basket.total') }}&nbsp;
                {{ totalQuantity }}
                <p>&nbsp;{{ $t('basket.explain') }}&nbsp;</p>
                {{ totalPrice }}
                {{ $t("basket.currency") }}
            </div>
        </div>
        <div v-else class='flex flex-col items-center gap-4'>
            <p class='text-4xl'>🥹</p>
            <p class='mb-10'>{{ $t('basket.empty') }}</p>
            <TheLink to="/" />
        </div>
    </block-wrapper>
</template>

<script setup lang="ts">
import { useBasketStore } from '~/stores/basketStore';

const store = useBasketStore()
const basket = computed(() => store.basket)
const totalQuantity = computed(() => store.totalQuantity)
const totalPrice = computed(() => store.totalPrice)

</script>
