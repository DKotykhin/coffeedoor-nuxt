<template>
    <section>
        <div v-if='!confirmPassword'>
            <PersonalConfirmPassword @confirm-password-event='confirmPasswordEvent' />
        </div>
        <div v-else>
            <PersonalChangePassword />
        </div>
    </section>
</template>

<script setup lang="ts">
const confirmPassword = ref(false);

definePageMeta({
    middleware: ['auth'],
});

useSeoMeta({
    title: "CoffeeDoor | Змінити пароль",
    description: "Змініть свій пароль на сайті CoffeeDoor",
});

const confirmPasswordEvent = (status: boolean) => {
    confirmPassword.value = status;
};
</script>