<template>
    <form-wrapper>
        <FormHeader :title="$t('auth.title_4')" />
        <form @submit="onSubmit" class='w-full flex flex-col gap-2 px-0 md:px-6'>
            <FormInputText name="email" :placeholder="$t('auth.emailPlaceholder')" :label="$t('auth.email')" />
            <UButton :loading='loading' type='submit' block size='lg' icon="i-heroicons-envelope" class='mt-6'>
                {{ $t('auth.passwordRecovery') }}
            </UButton>
        </form>
        <NuxtLink :to="localePath('/')" class='text-mint uppercase font-medium hover:underline mt-2 text-center'>
            {{ $t("auth.button") }}
        </NuxtLink>
    </form-wrapper>
</template>

<script setup lang='ts'>
import { useForm } from 'vee-validate';
import { toTypedSchema } from '@vee-validate/zod';

import { emailValidationSchema } from '@/validation/userValidation';

const toast = useToast();
const localePath = useLocalePath();

const loading = ref(false);

const { handleSubmit } = useForm({
    validationSchema: toTypedSchema(emailValidationSchema),
    initialValues: {
        email: '',
    },
});

const onSubmit = handleSubmit(async value => {  
    loading.value = true;
    const { error } = await $fetch('/api/user/reset-password', { 
        method: 'POST',
        body: value, 
    });
    loading.value = false;
    if (error) {
        toast.add({
            title: 'Password Recovery Error',
            description: error.message,
            color: 'red',
            icon: 'i-heroicons-x-circle',
        });
        return;
    }
    toast.add({
        title: 'Password Recovery Link',
        description: 'Successfully send link for password recovery',
        color: 'mint',
        icon: 'i-heroicons-check-circle',
    });
});
</script>