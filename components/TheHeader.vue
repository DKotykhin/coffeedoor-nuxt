<template>
    <header class='w-full flex justify-between items-center h-[80px] px-4 md:px-14 text-white dark:text-grey-200'>
        <NuxtLink to="/">
            <h1 class='text-2xl font-medium text-mint-500'>CoffeeDoor</h1>
        </NuxtLink>
        <div class='flex gap-4 items-center'>
            <NuxtLink :to="localePath('/menu')" class='hover:underline'>{{ $t('header.menu') }}</NuxtLink>
            <NuxtLink :to="localePath('/basket')" class='hover:underline'>
                <Icon name="mdi:cart" size='30' />
            </NuxtLink>
            <NuxtLink v-if='!userStore.user' :to="localePath('/auth/sign-in')" class='hover:underline'>
                {{ $t('header.signIn') }}
            </NuxtLink>
            <div v-else class='flex gap-4 items-center'>
                <NuxtLink :to="localePath('/profile')" class='hover:underline'>
                    {{ $t('header.profile') }}
                </NuxtLink>
                <UButton variant='outline' @click='signOut'>{{ $t('header.signOut') }}</UButton>
            </div>
        </div>
    </header>
</template>

<script setup lang="ts">
import { useUserStore } from '~/stores/userStore';

const userStore = useUserStore();
const localePath = useLocalePath();
const cookie = useCookie('token')

const signOut = () => {
    userStore.removeUser();
    cookie.value = '';
};
</script>