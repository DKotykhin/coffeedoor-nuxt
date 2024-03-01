<template>
    <div>
        <NuxtLink :to="localePath('/')">Home</NuxtLink>
        <NuxtLink :to="localePath('/menu')">Menu</NuxtLink>
        <h1>Thanks</h1>
    </div>
</template>

<script setup lang="ts">
const localePath = useLocalePath();

useSeoMeta({
    title: "Дякуємо за замовлення",
    description: "Сторінка успішного замовлення в онлайн магазині",
});
</script>