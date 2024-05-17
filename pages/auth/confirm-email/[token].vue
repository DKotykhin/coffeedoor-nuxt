<template>
    <main>
        <AuthConfirmEmail />
    </main>
</template>

<script setup>
const userStore = useUserStore();
const router = useRouter();
const localePath = useLocalePath();

useSeoMeta({
    title: "CoffeeDoor | Підтвердження пошти",
    description: "Сторінка підтвердження пошти",
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