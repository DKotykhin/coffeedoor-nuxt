<template>
    <div class="min-h-screen flex flex-col justify-between">
        <ColorMode />
        <slot />
    </div>
</template>

<script setup lang='ts'>
import type { User } from '@prisma/client';
import { useUserStore } from '~/stores/userStore';

const cookie = useCookie('token');
const userStore = useUserStore();

if (cookie.value) {
    const user = await $fetch('/api/user/get-user-by-token?token=' + cookie.value);
    userStore.addUser(user as User);
}
</script>