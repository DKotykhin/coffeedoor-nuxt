<template>
  <NuxtLayout>
    <NuxtPage />
    <TheFooter />
  </NuxtLayout>
</template>

<script setup lang="ts">
const basketStore = useBasketStore();

onMounted(() => {
  basketStore.initializeBasket()
})
</script>

