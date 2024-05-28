<template>
    <section class='flex flex-col items-center mt-12 gap-6 px-6'>
        <NuxtLink :to="localePath('/')">
            <NuxtImg src="/logo_700x191.webp" width='700' alt='logo' :placeholder="[700, 191]" />
        </NuxtLink>
        <div class='flex flex-col items-center mt-8 md:mt-12 gap-4 text-center'>
            <h1 class='text-3xl md:text-4xl font-bold'>
                {{ $t("thanks.title") }}
            </h1>
            <h2 class='text-lg md:text-2xl text-grey-500 font-light'>
                {{ $t("thanks.subtitle") }}
            </h2>
        </div>
        <TheLink to="/" />
    </section>
</template>

<script setup lang='ts'>
const localePath = useLocalePath();

</script>