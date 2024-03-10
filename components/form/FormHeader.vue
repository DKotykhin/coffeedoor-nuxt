<template>
    <h1 class='text-[24px] font-semibold mb-2'>
        {{ title }}
    </h1>
    <div class='flex justify-center items-center w-full text-center max-w-[80px] h-[80px] bg-grey-100 rounded-full'>
        <Icon name="mdi:account" size='50' class='text-grey-600' />
    </div>
</template>

<script setup lang='ts'>
defineProps({
    title: {
        type: String,
        required: true,
    },
});
</script>
