<template>
    <div v-if='totalQuantity > 0' class='fixed bottom-6 right-6 z-20 text-grey'>
        <NuxtLink :to="localePath('/basket')">
            <UChip :text="totalQuantity" size="2xl" inset :ui="{ base: '-m-1' }">
                <Icon name="mdi:basket-outline" size='50' />
            </UChip>
        </NuxtLink>
    </div>
</template>

<script setup lang="ts">
import { useBasketStore } from '~/stores/basketStore';
const store = useBasketStore()

const localePath = useLocalePath();

const totalQuantity = computed(() => store.totalQuantity)

onMounted(() => {
    store.initializeBasket()
})
</script>