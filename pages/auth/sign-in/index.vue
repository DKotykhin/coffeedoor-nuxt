<template>
    <main>
        <div v-if='isNotLogged'>
            <AuthSignInForm />
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
    title: "CoffeeDoor | Логін",
    description: "Сторінка для входу в особистий кабінет",
    ogImage: "https://coffeedoor-nuxt.vercel.app/background.webp",
    ogTitle: "Сторінка для входу в особистий кабінет",
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