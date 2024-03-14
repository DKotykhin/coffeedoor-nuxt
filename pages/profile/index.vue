<template>
    <main class='w-full h-full flex flex-col items-center'>
        <h1>Profile</h1>
        <TheLink :to="localePath('/')" />
    </main>
</template>

<script setup lang='ts'>
const localePath = useLocalePath();

definePageMeta({
    middleware: ['auth'],
})
</script>