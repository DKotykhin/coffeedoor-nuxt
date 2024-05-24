<template>
    <section>
        <PersonalChangeData />
    </section>
</template>

<script setup lang="ts">
definePageMeta({
    middleware: ['auth'],
});

useSeoMeta({
    title: "CoffeeDoor | Змінити персональні дані",
    description: "Змініть свої персональні дані на сайті CoffeeDoor",
});
</script>