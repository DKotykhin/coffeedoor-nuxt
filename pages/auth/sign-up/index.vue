<template>
    <main>
        <div v-if='isNotLogged'>
            <AuthSignUpForm />
        </div>
        <div v-else class='flex w-full justify-center items-center h-screen'>
            <TheSkeleton /> 
        </div>
    </main>
</template>

<script setup lang='ts'>
const { isLoggedIn } = useUserStore();
const localePath = useLocalePath();

useSeoMeta({
    title: "CoffeeDoor | Реєстрація",
    description: "Сторінка для реєстрації нового користувача",
    ogImage: "https://coffeedoor-nuxt.vercel.app/background.webp",
    ogTitle: "Сторінка для реєстрації нового користувача",
});

const isNotLogged = ref(false);
onMounted(() => {
    if (isLoggedIn) {
        return navigateTo(localePath('/'));
    } else {
        isNotLogged.value = true;
    }
});
</script>