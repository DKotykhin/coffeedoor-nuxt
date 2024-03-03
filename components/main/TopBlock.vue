<template>
    <section class='bg_image flex flex-col items-center w-full text-white dark:text-grey-200 h-[500px] md:h-[700px]'>
        <ColorMode />
        <transition name="fade">
            <div v-if="show" class='flex flex-col items-center h-full text-center px-2 mt-24'>
                <h1 class='text-5xl min-[360px]:text-6xl sm:text-8xl md:text-9xl lg:text-[150px] mb-6 font-bold'>
                    CoffeeDoor
                </h1>
                <h2 class='text-xl min-[360px]:text-2xl sm:text-4xl md:text-5xl lg:text-6xl font-bold'>
                    Brew Bar & Coffeeshop
                </h2>
                <div class='flex flex-col min-[360px]:flex-row gap-4 md:gap-8 mt-16'>
                    <NuxtLink :to="{ hash: '#contacts' }" class='hover:underline hover:text-mint'>Contacts</NuxtLink>
                    <NuxtLink :to="localePath('/menu')" class='hover:underline hover:text-mint'>Menu</NuxtLink>
                    <NuxtLink :to="localePath('/thanks')" class='hover:underline hover:text-mint'>Thanks</NuxtLink>
                </div>
            </div>
        </transition>
    </section>
</template>

<script setup lang="ts">
const localePath = useLocalePath();

const show = ref(false);

onMounted(() => {
    show.value = true;
});
</script>

<style scoped>
.fade-enter-active {
    transition: opacity 1.5s;
}

.fade-enter-from {
    opacity: 0;
}
</style>
