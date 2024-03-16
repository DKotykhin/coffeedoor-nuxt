<template>
    <main>
        <AuthSignInForm />
    </main>
</template>

<script setup>
const userStore = useUserStore();
const router = useRouter();
useSeoMeta({
    title: "CoffeeDoor | Логін",
    description: "Сторінка для входу в особистий кабінет",
    ogImage: "https://coffeedoor-nuxt.vercel.app/background.webp",
    ogTitle: "Сторінка для входу в особистий кабінет",
});
definePageMeta({
    middleware: ['auth'],
})
onMounted(() => {
    if (userStore.user) {
        router.push({ path: '/' });
    }
})
</script>