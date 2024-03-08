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
