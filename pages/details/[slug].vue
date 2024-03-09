<template>
    <section class='text-center'>
        <div v-if="pending">
            <TheSkeleton />
        </div>
        <div v-else class='my-4'>
            <p>Details Page: {{ slug }}</p>
            <p class='text-lg font-semibold my-4'>{{ data?.categoryTitle }} {{ data?.storeItem.title }}</p>
            <p>Recommendations list:</p>
            <div v-for='item in data?.recommendationList'>
                <p>{{ data?.categoryTitle }} {{ item.title }}</p>
            </div>
        </div>
        <TheLink to="/" />
    </section>
</template>

<script setup lang="ts">
const route = useRoute();
const slug = ref(route.params.slug);

const { data, pending } = await useAsyncData('details', () => $fetch(`/api/item-by-slug?slug=${slug.value}`));

useSeoMeta({
    title: `CoffeeDoor | ${data.value?.storeItem.title || "Сторінка товара"}`,
    description: "Сторінка товара",
    keywords: "кава в зернах, крафтовий чай, зелений чай",
    ogImage: "https://coffeedoor-nuxt.vercel.app/menu-image.jpg",
    ogTitle: `CoffeeDoor | ${data.value?.storeItem.title || "Сторінка товара"}`,
});
</script>