<template>
    <ClientOnly>
        <header class='w-full h-18 bg-mint'>
            <div class="flex justify-end items-center max-w-[1440px] w-full py-3 px-6">
                <p class='text-lg text-white mr-4'>{{ userStore.user?.userName }}</p>
                <UDropdown :items="userItems" :popper="{ placement: 'bottom-start' }">
                    <UAvatar :src="avatarUrl" :alt="userStore.user?.userName || 'avatar'"
                        icon="i-heroicons-user-16-solid" />
                </UDropdown>
            </div>
        </header>
    </ClientOnly>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router';
import { useI18n } from 'vue-i18n';

const { t } = useI18n();
const localePath = useLocalePath();
const userStore = useUserStore();
const router = useRouter();
const cookie = useCookie('token');

const avatarUrl = useImageUrl(userStore.user?.avatar || '');

const signOut = () => {
    userStore.removeUser();
    cookie.value = '';
    router.push({ path: localePath('/') });
};

const userItems = [
    [{
        label: t('top.button_1'),
        icon: 'i-heroicons-shopping-bag',
        click: () => {
            router.push({ path: localePath('/') });
        }
    },
    {
        label: t('top.button_2'),
        icon: 'i-heroicons-clipboard-document-list',
        click: () => {
            router.push({ path: localePath('/menu') });
        }
    },
    {
        label: t('top.button_3'),
        icon: 'i-heroicons-user-16-solid',
        click: () => {
            router.push({ path: localePath('/change-avatar') });
        }
    }],
    [{
        label: t('header.signOut'),
        icon: 'i-heroicons-arrow-right-on-rectangle',
        click: signOut
    }]
]
</script>