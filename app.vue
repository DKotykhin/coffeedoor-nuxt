<template>
  <NuxtLayout>
    <NuxtPage />
    <TheFooter />
  </NuxtLayout>
  <UNotifications />
</template>

<script setup lang="ts">
const basketStore = useBasketStore();

onMounted(() => {
  basketStore.initializeBasket()
})
</script>

