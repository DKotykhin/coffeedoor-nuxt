<template>
    <section class='text-center'>
        <div v-if="pending">
            <TheSkeleton />
        </div>
        <div v-else class='my-4'>
            <DetailsItem :data="data" />
        </div>
        <TheLink to="/" />
    </section>
</template>

<script setup>
const route = useRoute();
const slug = ref(route.params.slug);

const { data, pending } = await useAsyncData('details', () => $fetch(`/api/store/item-by-slug?slug=${slug.value}`));

useSeoMeta({
    title: `CoffeeDoor | ${data.value?.storeItem.title || "Сторінка товара"}`,
    description: "Сторінка товара",
    keywords: "кава в зернах, крафтовий чай, зелений чай",
    ogImage: "https://coffeedoor-nuxt.vercel.app/menu-image.jpg",
    ogTitle: `CoffeeDoor | ${data.value?.storeItem.title || "Сторінка товара"}`,
});
</script>