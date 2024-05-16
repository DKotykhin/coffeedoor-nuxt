<template>
    <main>
        <AuthConfirmEmail />
    </main>
</template>

<script setup>
useSeoMeta({
    title: "CoffeeDoor | Підтвердження пошти",
    description: "Сторінка підтвердження пошти",
});
definePageMeta({
    middleware: ['auth'],
})
</script>