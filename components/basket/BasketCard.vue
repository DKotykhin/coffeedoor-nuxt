<template>
    <block-wrapper>
        <h1 class='text-2xl mb-4 font-medium'>{{ $t('basket.title') }}</h1>
        <div v-if='basket.length' class='w-full max-w-[700px] flex flex-col items-center'>
            <BasketList />
            <UButton :to="localePath('/')" size='lg' class='my-4'>
                {{ $t("basket.back") }}
            </UButton>
            <BasketForm @submit-event='submitForm' />
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
import { useRouter } from 'vue-router';
import type { BasketFormTypes } from '~/validation/basketValidation';
import { useUserStore } from '~/stores/userStore';

const userStore = useUserStore();

const localePath = useLocalePath();
const router = useRouter();
const basketStore = useBasketStore();

const basket = computed(() => basketStore.basket);

const submitForm = async (values: BasketFormTypes) => {
    const orderData = {
        userFormData: values,
        basketData: basketStore.basket,
        userId: userStore.user?.id,
    };
    console.log(orderData);
    const status = await $fetch('/api/store/send-order', {
        method: 'POST',
        body: orderData,
    });
    if (status?.status) {
        basketStore.clearBasket();
        router.push({ path: localePath('/thanks') });
    }
};
</script>
