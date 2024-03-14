<template>
    <form-wrapper>
        <FormHeader :title="$t('auth.title_2')" />
        <form @submit="onSubmit" class='w-full flex flex-col gap-2 px-0 md:px-6'>
            <FormInputText name="email" :placeholder="$t('auth.emailPlaceholder')" :label="$t('auth.email')" />
            <FormInputPassword name="password" :placeholder="$t('auth.passwordPlaceholder')" :label="$t('auth.password')" />
            <UButton block size='lg' type='submit' icon="i-heroicons-lock-open" class='mt-6'>
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

<script setup>
import { useForm } from 'vee-validate';
import { toTypedSchema } from '@vee-validate/zod';
import { signInValidationSchema } from '@/validation/userValidation';
import { useUserStore } from '~/stores/userStore';

const store = useUserStore();

const localePath = useLocalePath();
const { handleSubmit } = useForm({
    validationSchema: toTypedSchema(signInValidationSchema),
    initialValues: {
        email: '',
        password: '',
    },
});

const onSubmit = handleSubmit(async values => {
    const user = await $fetch('/api/user/sign-in', {
        method: 'POST',
        body: values,
    });
    console.log(user.token);
    store.addUser(user.user);
});
</script>