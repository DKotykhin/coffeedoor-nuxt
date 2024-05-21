<template>
    <main>
        <div v-if='isNotLogged'>
            <AuthResetPasswordForm />
        </div>
        <div v-else class='flex w-full justify-center items-center h-screen'>
            <TheSkeleton /> 
        </div>
    </main>
</template>

<script setup>
const { isLoggedIn } = useUserStore();
const localePath = useLocalePath();

useSeoMeta({
    title: "CoffeeDoor | Відновлення паролю",
    description: "Сторінка для відновлення паролю",
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