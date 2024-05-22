<template>
    <form-wrapper>
        <FormHeader :title="$t('auth.title_3')" />
        <form @submit="onSubmit" class='w-full flex flex-col gap-2 px-0 md:px-6'>
            <FormInputText name="email" :placeholder="$t('auth.emailPlaceholder')" :label="$t('auth.email')" />
            <UButton :loading='loading' type='submit' block size='lg' icon="i-heroicons-envelope" class='mt-6'>
                {{ $t('auth.resendEmail') }}
            </UButton>
        </form>
    </form-wrapper>
</template>

<script setup>
import { useForm } from 'vee-validate';
import { toTypedSchema } from '@vee-validate/zod';

import { emailValidationSchema } from '@/validation/userValidation';

const route = useRoute();
const localePath = useLocalePath();
const { toastError, toastSuccess } = useAppToast();
const loading = ref(false);

const { handleSubmit } = useForm({
    validationSchema: toTypedSchema(emailValidationSchema),
    initialValues: {
        email: '',
    },
});

const onSubmit = handleSubmit(async value => {       
    loading.value = true;
    const { data, error } = await $fetch('/api/user/resend-email', { 
        method: 'POST',
        body: value, 
    });
    loading.value = false;
    if (error) {
        toastError({
            title: 'Resend Email Error',
            description: error.message,
        });
        return;
    }
    toastSuccess({
        title: 'Successfully resend Email',
        description: data.message,
    });
});

onMounted(async () => {
    if (!route.params.token) return;
    const { data, error } = await $fetch(`/api/user/verify-email?token=${route.params.token}`);
    if (error) {
        toastError({
            title: 'Verify Email Error',
            description: error.message,
        });
        return;
    }
    if (data?.status) return navigateTo(localePath('/'));
});
</script>