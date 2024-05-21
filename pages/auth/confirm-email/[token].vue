<template>
    <main>
        <div v-if='isNotLogged'>
            <AuthConfirmEmail />
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
    title: "CoffeeDoor | Підтвердження пошти",
    description: "Сторінка підтвердження пошти",
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