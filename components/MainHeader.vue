<template>
    <header
        class='w-full max-w-[1440px] flex justify-between items-center h-[80px] pl-4 pr-14 md:px-14 text-white dark:text-grey-200'>
        <NuxtLink to="/">
            <h1 class='text-2xl font-medium text-mint-500'>CoffeeDoor</h1>
        </NuxtLink>
        <div class='flex gap-4 md:gap-8 items-center'>
            <UDropdown :items="pageItems" :popper="{ placement: 'bottom-start' }">
                <UButton variant='ghost' :label="$t('header.title_1')" trailing-icon="i-heroicons-chevron-down-20-solid" />
            </UDropdown>
            <div class='flex gap-4'>
                <NuxtLink v-for="local in locales" :key="local.code" :to="switchLocalePath(local.code)"
                    :class="['hover:underline', local.code === locale ? 'text-white dark:text-grey-200' : 'text-grey-500']">
                    {{ local.name }}
                </NuxtLink>
            </div>
            <NuxtLink v-if='!userStore.user' :to="localePath('/auth/sign-in')" class='hover:underline'>
                {{ $t('header.signIn') }}
            </NuxtLink>
            <UDropdown v-else :items="userItems" :popper="{ placement: 'bottom-start' }">
                <UAvatar :src="userStore.user.avatar || ''" :alt="userStore.user.userName || 'avatar'"
                    icon="i-heroicons-user-16-solid" />
            </UDropdown>
        </div>
    </header>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router';
import { useI18n } from 'vue-i18n';

const { t, locale, locales } = useI18n();
const localePath = useLocalePath();
const switchLocalePath = useSwitchLocalePath();
const userStore = useUserStore();
const cookie = useCookie('token');
const router = useRouter();

const signOut = () => {
    userStore.removeUser();
    cookie.value = '';
};

const userItems = [
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

const pageItems = [
    [{
        label: t('header.link_11'),
        icon: 'i-heroicons-shopping-bag',
        click: () => {
            router.push({ hash: '#1' });
        }
    },
    {
        label: t('header.link_12'),
        icon: 'i-heroicons-shopping-bag',
        click: () => {
            router.push({ hash: '#2' });
        }
    },
    {
        label: t('header.link_13'),
        icon: 'i-heroicons-shopping-bag',
        click: () => {
            router.push({ hash: '#3' });
        }
    },
    {
        label: t('header.link_14'),
        icon: 'i-heroicons-shopping-bag',
        click: () => {
            router.push({ hash: '#4' });
        }
    },
    {
        label: t('header.link_15'),
        icon: 'i-heroicons-shopping-bag',
        click: () => {
            router.push({ hash: '#5' });
        }
    }],
    [{
        label: t('header.link_21'),
        icon: 'i-heroicons-information-circle',
        click: () => {
            router.push({ hash: '#about' });
        }
    },
    {
        label: t('header.link_23'),
        icon: 'i-heroicons-phone',
        click: () => {
            router.push({ hash: '#contacts' });
        }
    }]
]
</script>