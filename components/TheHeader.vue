<template>
    <header class='w-full flex justify-between items-center h-[80px] px-4 md:px-14 text-white dark:text-grey-200'>
        <NuxtLink to="/">
            <h1 class='text-2xl font-medium text-mint-500'>CoffeeDoor</h1>
        </NuxtLink>
        <div class='flex gap-4'>
            <NuxtLink :to="localePath('/menu')" class='hover:underline'>{{ $t('header.menu') }}</NuxtLink>
            <NuxtLink :to="localePath('/basket')" class='hover:underline'>
                <Icon name="mdi:cart" size='30' />
            </NuxtLink>
            <NuxtLink :to="localePath('/auth/sign-in')" class='hover:underline'>{{ $t('header.signIn') }}</NuxtLink>
        </div>
    </header>
</template>

<script setup lang="ts">
const localePath = useLocalePath();
</script>