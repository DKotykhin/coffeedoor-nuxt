<template>
    <main>
        <AuthResetPasswordForm />
    </main>
</template>

<script setup>
const userStore = useUserStore();
const router = useRouter();
const localePath = useLocalePath();

useSeoMeta({
    title: "CoffeeDoor | Відновлення паролю",
    description: "Сторінка для відновлення паролю",
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