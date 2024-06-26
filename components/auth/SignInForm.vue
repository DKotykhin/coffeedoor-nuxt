<template>
    <form-wrapper>
        <FormHeader :title="$t('auth.title_2')" />
        <form @submit="onSubmit" class='w-full flex flex-col gap-2 px-0 md:px-6'>
            <FormInputText name="email" :placeholder="$t('auth.emailPlaceholder')" :label="$t('auth.email')" />
            <FormInputPassword name="password" :placeholder="$t('auth.passwordPlaceholder')" :label="$t('auth.password')" />
            <p @click='forgotPassword' class='w-full flex justify-end text-sm text-mint cursor-pointer'>forgot password?</p>
            <UButton :loading='loading' block size='lg' type='submit' icon="i-heroicons-lock-open" class='mt-6'>
                {{ $t('auth.signIn') }}
            </UButton>
        </form>
        <div class='w-full text-center text-[14px] mt-4'>
            <p>{{ $t('auth.message_3') }}</p>
            <p>
                <NuxtLink :to="localePath('/auth/sign-up')" class='text-mint hover:underline'>
                    {{ $t('auth.signUp') }}&nbsp;
                </NuxtLink>
                {{ $t('auth.message_4') }}
            </p>
        </div>
        <NuxtLink :to="localePath('/')" class='text-mint uppercase font-medium hover:underline mt-2 text-center'>
            {{ $t("auth.button") }}
        </NuxtLink>
    </form-wrapper>
</template>

<script setup lang='ts'>
import { useForm } from 'vee-validate';
import { toTypedSchema } from '@vee-validate/zod';

import { signInValidationSchema } from '@/validation/userValidation';
import { useUserStore } from '~/stores/userStore';

const loading = ref(false);
const { toastError } = useAppToast();
const cookie = useCookie('token');
const userStore = useUserStore();
const localePath = useLocalePath();

const { handleSubmit } = useForm({
    validationSchema: toTypedSchema(signInValidationSchema),
    initialValues: {
        email: '',
        password: '',
    },
});

const onSubmit = handleSubmit(async values => {       
    loading.value = true;
    const { data, error }: any = await $fetch('/api/user/sign-in', {
        method: 'POST',
        body: values,
    });
    loading.value = false;
    if (error) {
        toastError({
            title: 'Sign In',
            description: error.message,
        });
        return;
    }
    userStore.addUser(data.user);
    if (data.token) {
        cookie.value = data.token;
        navigateTo(localePath('/'));
    }
});

const forgotPassword = () => {
    return navigateTo(localePath('/auth/reset-password'));
};
</script>