<template>
    <section>
        <AvatarChangeAvatar />
    </section>
</template>

<script setup lang="ts">
definePageMeta({
    middleware: ['auth'],
});

useSeoMeta({
    title: "CoffeeDoor | Змінити аватарку",
    description: "Змініть свою аватарку на сайті CoffeeDoor",
});
</script>