<template>
    <section class="flex justify-center w-full">
        <div class='max-w-[1440px] w-full mt-2 px-4'>
            <div v-if="pending">
                <TheSkeleton />
            </div>
            <div v-else>
                <DetailsItem :data="data" />
                <BasketIcon />
            </div>
        </div>
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