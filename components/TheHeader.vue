<template>
    <header class='w-full flex justify-between items-center h-[80px] pl-4 pr-14 md:px-14 text-white dark:text-grey-200'>
        <NuxtLink to="/">
            <h1 class='text-2xl font-medium text-mint-500'>CoffeeDoor</h1>
        </NuxtLink>
        <div class='flex gap-4 items-center'>
            <NuxtLink v-if='!userStore.user' :to="localePath('/auth/sign-in')" class='hover:underline'>
                {{ $t('header.signIn') }}
            </NuxtLink>
            <UDropdown v-else :items="items" :popper="{ placement: 'bottom-start' }">
                <UAvatar :src="userStore.user.avatar || ''" :alt="userStore.user.userName || 'avatar'"
                    icon="i-heroicons-user-16-solid" />
            </UDropdown>
        </div>
    </header>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router';
import { useI18n } from 'vue-i18n';
import { useUserStore } from '~/stores/userStore';

const { t } = useI18n();

const userStore = useUserStore();
const localePath = useLocalePath();
const cookie = useCookie('token');
const router = useRouter();

const signOut = () => {
    userStore.removeUser();
    cookie.value = '';
};

const items = [
    [{
        label: t('header.profile'),
        icon: 'i-heroicons-user-16-solid',
        click: () => {
            router.push({ path: localePath('/profile') });
        }
    }],
    [{
        label: t('header.signOut'),
        icon: 'i-heroicons-arrow-right-on-rectangle',
        click: signOut
    }]
]
</script>