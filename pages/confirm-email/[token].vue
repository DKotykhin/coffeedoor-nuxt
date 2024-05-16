<template>
    <span>Email confirmation page</span>
</template>

<script setup>
const route = useRoute();
const router = useRouter();
const localePath = useLocalePath();
const toast = useToast();

onMounted(async () => {
    if (!route.params.token) return;
    const { data, error } = await $fetch(`/api/user/verify-email?token=${route.params.token}`);
    if (error) {
        toast.add({
            title: 'Sign In',
            description: error.message,
            color: 'red',
        });
        return;
    }
    if (data?.status) await router.push({ path: localePath('/') });
});

</script>