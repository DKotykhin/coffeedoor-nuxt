<template>
    <main>
        <AuthSignUpForm />
    </main>
</template>

<script setup>
const userStore = useUserStore();
const router = useRouter();
const localePath = useLocalePath();

useSeoMeta({
    title: "CoffeeDoor | Реєстрація",
    description: "Сторінка для реєстрації нового користувача",
    ogImage: "https://coffeedoor-nuxt.vercel.app/background.webp",
    ogTitle: "Сторінка для реєстрації нового користувача",
});
definePageMeta({
    middleware: ['auth'],
});
watchEffect(() => {
    if (userStore.isLoggedIn) {
        router.push({ path: localePath('/') });
    }
});
</script>