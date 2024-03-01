<template>
    <section class='flex flex-col items-center mt-10 gap-6 px-4'>
        <NuxtLink :to="localePath('/')">
            <NuxtImg src="/logo_700x191.webp" width='700' alt='logo' :placeholder="[700, 191]" />
        </NuxtLink>
        <div class='flex flex-col items-center mt-6 md:mt-10 gap-2 md:gap-4 text-center'>
            <h1 class='text-3xl md:text-4xl font-bold'>
                {{ $t("menu.title") }}
            </h1>
            <h2 class='text-lg md:text-2xl text-grey-500 font-light'>
                {{ $t("menu.subtitle") }}
            </h2>
        </div>
        <div class='flex gap-4'>
            <NuxtLink v-for="local in locales" :key="local.code" :to="switchLocalePath(local.code)"
                :class="[local.code === locale ? 'link bg-mint text-white dark:text-grey-200' : 'link border-grey-200 text-grey-500']">
                {{ local.name }}
            </NuxtLink>
        </div>
        <NuxtLink :to="localePath('/')" class='hover:underline hover:text-mint'>
            {{ $t("menu.button") }}
        </NuxtLink>
    </section>
</template>

<script setup>
const localePath = useLocalePath();
const { locale, locales } = useI18n()
const switchLocalePath = useSwitchLocalePath()

</script>

<style scoped>
.link {
    @apply border rounded-lg px-4 py-1 font-medium;
}
</style>
