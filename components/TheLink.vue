<template>
    <NuxtLink :to="localePath(to)" class='hover:underline hover:text-mint mb-8'>
        {{ $t("menu.button") }}
    </NuxtLink>
</template>

<script setup>
const localePath = useLocalePath();

defineProps({
    to: {
        type: String,
        required: true,
    },
});
</script>