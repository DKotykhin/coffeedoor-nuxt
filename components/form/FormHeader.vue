<template>
    <h1 class='text-[24px] font-semibold'>
        {{ title }}
    </h1>
    <ClientOnly>
        <UAvatar size='3xl' :src="avatarUrl" :alt="userStore.user?.userName || 'avatar'" icon="i-heroicons-user-16-solid" />
    </ClientOnly>
</template>

<script setup lang='ts'>
const userStore = useUserStore();
const avatarUrl = useImageUrl(userStore.user?.avatar || '');

defineProps({
    title: {
        type: String,
        required: true,
    },
});
</script>
