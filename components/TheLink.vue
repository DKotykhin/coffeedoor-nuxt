<template>
    <UButton :to="localePath(to)" size='lg' class='mb-8'>
        {{ $t("menu.button") }}
    </UButton>
</template>

<script setup lang='ts'>
const localePath = useLocalePath();

defineProps({
    to: {
        type: String,
        required: true,
    },
});
</script>