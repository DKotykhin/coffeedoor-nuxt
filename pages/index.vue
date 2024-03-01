<template>
  <div>
    <div class='flex gap-4 m-4'>
      <NuxtLink :to="localePath('/menu')" class='hover:underline hover:text-mint'>Menu</NuxtLink>
      <NuxtLink :to="localePath('/thanks')" class='hover:underline hover:text-mint'>Thanks</NuxtLink>
    </div>
    <MainInfo />
  </div>
</template>

<script setup lang="ts">
const localePath = useLocalePath();

useSeoMeta({
  title: "CoffeeDoor - кав'ярня та магазин свіжообсмаженої кави",
  description: "CoffeeDOOR – це кавовий бренд, який по'єднує в собі свіжообсмажену каву рівня Speciality, кращі кавові технології, стильний дизайнерський інтер'єр, швидкий і дружній сервіс",
  keywords: "кава в зернах, кавомолка, пуровер, чай Soho, свыжообсмажена кава, купити каву в зернах",
  ogImage: "https://coffeedoor-next14-sql.vercel.app/background.webp",
});
</script>