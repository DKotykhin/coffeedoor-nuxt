<template>
    <div v-if='totalQuantity > 0' class='fixed bottom-6 right-6 z-20 text-grey'>
        <NuxtLink :to="localePath('/basket')">
            <UChip :text="totalQuantity" size="2xl" inset :ui="{ base: '-m-1' }">
                <Icon name="mdi:basket-outline" :class="['added-animation', showAnimation ? 'text-[60px]' : 'text-[50px]']" />
            </UChip>
        </NuxtLink>
    </div>
</template>

<script setup lang="ts">
import { useBasketStore } from '~/stores/basketStore';

const store = useBasketStore();
const localePath = useLocalePath();
const showAnimation = ref(false);

const totalQuantity = computed(() => store.totalQuantity);

watch(totalQuantity, (newValue, oldValue) => {
    if (newValue > oldValue) {
        showAnimation.value = true;
        setTimeout(() => {
            showAnimation.value = false;
        }, 500);
    }
});
</script>

<style scoped>
.added-animation {
    transition: all 0.3s ease-in-out;
}
</style>