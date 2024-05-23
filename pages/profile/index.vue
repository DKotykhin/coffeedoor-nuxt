<template>
    <main class='w-full h-full flex flex-col items-center'>
        <ProfileOrderInfo />
        <BasketIcon />
    </main>
</template>

<script setup lang='ts'>
definePageMeta({
    middleware: ['auth'],
});

useSeoMeta({
  title: "CoffeeDoor | Профіль",
  description: "CoffeeDOOR – це кавовий бренд, який по'єднує в собі свіжообсмажену каву рівня Speciality, кращі кавові технології, стильний дизайнерський інтер'єр, швидкий і дружній сервіс",
  keywords: "кава в зернах, кавомолка, пуровер, чай Soho, свыжообсмажена кава, купити каву в зернах",
  ogImage: "https://coffeedoor-nuxt.vercel.app/background.webp",
  ogTitle: "CoffeeDoor - кабінет користувача",
});
</script>