<template>
    <block-wrapper>
        <div class='w-full -mt-2 md:-mt-8'>
            <UButton :to="localePath('/profile')" variant='ghost' class='p-0'>
                <Icon name="i-mdi-arrow-left" size='30' />
            </UButton>
        </div>
        <form-wrapper>
            <FormHeader :title="$t('top.button_4')" />
            <form @submit="onSubmit" class='w-full flex flex-col gap-2 px-0 md:px-6'>
                <FormInputPassword name="password" :placeholder="$t('auth.passwordPlaceholder')"
                    :label="$t('profile.newPassword')" />
                <FormInputPassword name="confirmPassword" :placeholder="$t('auth.passwordPlaceholder')"
                    :label="$t('auth.retypePassword')" />
                <UButton :loading='loading' block size='lg' type='submit' icon="i-heroicons-lock-open" class='mt-6'>
                    {{ $t('profile.changePassword') }}
                </UButton>
            </form>
                <NuxtLink :to="localePath('/')"
                    class='text-mint uppercase font-medium hover:underline mt-8 text-center'>
                    {{ $t("auth.button") }}
                </NuxtLink>
        </form-wrapper>
    </block-wrapper>
</template>

<script setup lang="ts">
import { useForm } from 'vee-validate';
import { toTypedSchema } from '@vee-validate/zod';

import { setNewPasswordValidationSchema } from '@/validation/userValidation';

const loading = ref(false);

const { toastError, toastSuccess } = useAppToast();
const localePath = useLocalePath();

const { handleSubmit } = useForm({
    validationSchema: toTypedSchema(setNewPasswordValidationSchema),
    initialValues: {
        password: '',
        confirmPassword: '',
    },
});

const onSubmit = handleSubmit(async values => {
    loading.value = true;
    const { data, error }: any = await $fetch('/api/user/change-password', {
        method: 'POST',
        body: values,
    });
    loading.value = false;
    if (error) {
        toastError({
            title: 'Change Password Error',
            description: error.message,
        });
        return;
    }
    toastSuccess({
        title: 'Change Password Success',
        description: 'Password has been changed successfully.',
    });
    navigateTo(localePath('/profile'));
});
</script>