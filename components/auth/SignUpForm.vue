<template>
    <form-wrapper>
        <FormHeader :title="$t('auth.title_1')" />
        <form @submit="onSubmit" class='w-full flex flex-col gap-2 px-0 md:px-6'>
            <FormInputText name="userName" :placeholder="$t('auth.userNamePlaceholder')" :label="$t('auth.userName')" />
            <FormInputText name="email" :placeholder="$t('auth.emailPlaceholder')" :label="$t('auth.email')" />
            <FormInputPassword name="password" :placeholder="$t('auth.passwordPlaceholder')" :label="$t('auth.password')" />
            <UButton :loading='loading' block size='lg' type='submit' icon="i-heroicons-pencil-square" class='mt-6'>
                {{ $t('auth.signUp') }}
            </UButton>
        </form>
        <div class='w-full text-center text-[14px] mt-4'>
            <p>{{ $t('auth.message_1') }}</p>
            <p>
                <NuxtLink :to="localePath('/auth/sign-in')" class='text-mint hover:underline'>
                    {{ $t('auth.signIn') }}&nbsp;
                </NuxtLink>
                {{ $t('auth.message_2') }}
            </p>
        </div>
        <NuxtLink :to="localePath('/')" class='text-mint uppercase font-medium hover:underline mt-2 text-center'>
            {{ $t("auth.button") }}
        </NuxtLink>
    </form-wrapper>
</template>

<script setup>
import { useRouter } from 'vue-router';
import { useForm } from 'vee-validate';
import { toTypedSchema } from '@vee-validate/zod';

import { signUpValidationSchema } from '@/validation/userValidation';

const loading = ref(false);
const toast = useToast();
const localePath = useLocalePath();

const { handleSubmit } = useForm({
    validationSchema: toTypedSchema(signUpValidationSchema),
    initialValues: {
        userName: '',
        email: '',
        password: '',
    },
});

const onSubmit = handleSubmit(async values => {
    loading.value = true;
    const { error } = await $fetch('/api/user/sign-up', {
        method: 'POST',
        body: values,
    });
    loading.value = false;
    if (error) {
        toast.add({
            title: 'Sign Up',
            description: error.message,
            color: 'red',
            icon: 'i-heroicons-x-circle',
        });
        return;
    }
    toast.add({
        title: 'Sign Up',
        description: 'Email verification link has been sent to your email. Please verify your email to sign in.',
        color: 'mint',
        icon: 'i-heroicons-check-circle',
    });
    return navigateTo(localePath('/auth/sign-in'));
});
</script>