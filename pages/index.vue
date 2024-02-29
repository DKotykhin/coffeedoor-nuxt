<template>
    <div>
        <NuxtLink to="/menu">Menu</NuxtLink>
        <!-- <NuxtPage /> -->
        <h1 class='text-mint'>Main Page</h1>
    </div>
</template>

<script setup lang="ts">
useSeoMeta({
    title: "CoffeeDoor - кав'ярня та магазин свіжообсмаженої кави",
    description: "CoffeeDOOR – це кавовий бренд, який по'єднує в собі свіжообсмажену каву рівня Speciality, кращі кавові технології, стильний дизайнерський інтер'єр, швидкий і дружній сервіс",
    keywords: "кава в зернах, кавомолка, пуровер, чай Soho, свыжообсмажена кава, купити каву в зернах",
    ogImage: "https://coffeedoor-next14-sql.vercel.app/background.webp",
});
</script>