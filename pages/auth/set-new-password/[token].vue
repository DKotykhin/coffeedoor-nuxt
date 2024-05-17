<template>
    <main>
        <AuthSetNewPassword />
    </main>
</template>

<script setup>
const userStore = useUserStore();
const router = useRouter();
const localePath = useLocalePath();

useSeoMeta({
    title: "CoffeeDoor | Встановлення паролю",
    description: "Сторінка встановлення паролю",
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