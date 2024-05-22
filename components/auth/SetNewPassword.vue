<template>
    <form-wrapper>
        <FormHeader :title="$t('auth.title_5')" />
        <form @submit="onSubmit" class='w-full flex flex-col gap-2 px-0 md:px-6'>
            <FormInputPassword name="password" :placeholder="$t('auth.passwordPlaceholder')"
                :label="$t('auth.newPassword')" />
            <FormInputPassword name="confirmPassword" :placeholder="$t('auth.passwordPlaceholder')"
                :label="$t('auth.retypePassword')" />
            <UButton :loading='loading' type='submit' block size='lg' icon="i-heroicons-envelope" class='mt-6'>
                {{ $t('auth.setNewPassword') }}
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

import { setNewPasswordValidationSchema } from '@/validation/userValidation';

const localePath = useLocalePath();
const route = useRoute();
const { toastError, toastSuccess } = useAppToast();
const loading = ref(false);

const { handleSubmit } = useForm({
    validationSchema: toTypedSchema(setNewPasswordValidationSchema),
    initialValues: {
        password: '',
        confirmPassword: '',
    },
});

const onSubmit = handleSubmit(async value => {
    loading.value = true;
    const { error }: { error: any } = await $fetch(`/api/user/set-new-password?token=${route.params.token}`, {
        method: 'POST',
        body: value,
    });
    loading.value = false;
    if (error) {
        toastError({
            title: 'Set New Password Error',
            description: error.message,
        });
        return;
    }
    toastSuccess({
        title: 'Set New Password Success',
        description: 'Successfully set new password',
    });
    return navigateTo(localePath('/auth/sign-in'));
});
</script>