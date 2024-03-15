<template>
  <NuxtLayout>
    <NuxtPage />
    <TheFooter />
  </NuxtLayout>
</template>

<script setup lang="ts">
import { useBasketStore } from '~/stores/basketStore';

const store = useBasketStore()
onMounted(() => {
  store.initializeBasket()
})
</script>

