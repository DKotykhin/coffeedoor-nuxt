<template>
    <section class='bg_image flex flex-col items-center w-full text-white h-[500px] md:h-[700px]'>
        <div class='flex flex-col items-center h-full text-center px-2 mt-16'>
            <h1 class='text-5xl min-[360px]:text-6xl sm:text-8xl md:text-9xl lg:text-[150px] mb-6 font-bold'>
                CoffeeDoor
            </h1>
            <h2 class='text-xl min-[360px]:text-2xl sm:text-4xl md:text-5xl lg:text-6xl font-bold'>
                Brew Bar & Coffeeshop
            </h2>
        </div>
        <div class='flex gap-4 m-4'>
            <NuxtLink :to="localePath('/menu')" class='hover:underline hover:text-mint'>Menu</NuxtLink>
            <NuxtLink :to="localePath('/thanks')" class='hover:underline hover:text-mint'>Thanks</NuxtLink>
        </div>
    </section>
</template>

<script setup lang="ts">
const localePath = useLocalePath();
</script>