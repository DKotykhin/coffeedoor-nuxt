<template>
    <div class='flex flex-col items-center'>
        <MenuHeader />
        <MenuTheAccordion />
        <TheLink to="/" />
    </div>
</template>

<script setup lang="ts">
useSeoMeta({
    title: "CoffeeDoor | Меню кав'ярні",
    description: "Пропонуємо напої зі свіжообсмаженої кави та чаї за власними рецептами",
    keywords: "еспресо, допіо, капучино, крафтовий чай, зелений чай, капуоранж",
    ogImage: "https://coffeedoor-nuxt.vercel.app/menu-image.jpg",
    ogTitle: "CoffeeDoor | Меню кав'ярні",
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
}
</style>