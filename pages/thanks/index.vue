<template>
    <main>
        <ThanksHeader />
    </main>
</template>

<script setup lang="ts">

useSeoMeta({
    title: "Дякуємо за замовлення",
    description: "Сторінка успішного замовлення в онлайн магазині",
});
</script>

<style scoped>
.page-enter-active,
.page-leave-active {
    transition: all 0.4s;
}

.page-enter-from,
.page-leave-to {
    opacity: 0;
    filter: blur(1rem);
}</style>