<template>
    <block-wrapper>
        <div class='w-full -mt-2 md:-mt-8'>
            <UButton :to="localePath('/profile')" variant='ghost' class='p-0'>
                <Icon name="i-mdi-arrow-left" size='30' />
            </UButton>
        </div>
        <form-wrapper>
            <FormHeader :title="$t('top.button_5')" />
            <ClientOnly>
                <form @submit="onSubmit" class='w-full flex flex-col gap-2 px-0 md:px-6'>
                    <FormInputText name="email" :placeholder="$t('auth.emailPlaceholder')" :label="$t('auth.email')" :disabled='true' />
                    <FormInputText name="userName" :placeholder="$t('auth.userNamePlaceholder')" :label="$t('auth.userName')" />
                    <FormInputText name="phone" :placeholder="$t('profile.phonePlaceholder')" :label="$t('profile.phone')" />
                    <FormInputText name="address" :placeholder="$t('profile.addressPlaceholder')" :label="$t('profile.address')" />
                    <UButton :loading='loading' block size='lg' type='submit' icon="i-heroicons-pencil-square-16-solid" class='mt-6'>
                        {{ $t('profile.changeData') }}
                    </UButton>
                </form>
            </ClientOnly>
            <NuxtLink :to="localePath('/')" class='text-mint uppercase font-medium hover:underline mt-8 text-center'>
                {{ $t("auth.button") }}
            </NuxtLink>
        </form-wrapper>
    </block-wrapper>
</template>

<script setup lang="ts">
import { useForm } from 'vee-validate';
import { toTypedSchema } from '@vee-validate/zod';

import { personalDataValidationSchema } from '@/validation/userValidation';

const loading = ref(false);

const { toastError, toastSuccess } = useAppToast();
const localePath = useLocalePath();
const userStore = useUserStore();

const address = computed(() => userStore.user?.address);
const phone = computed(() => userStore.user?.phone);
const userName = computed(() => userStore.user?.userName);

const { handleSubmit } = useForm({
    validationSchema: toTypedSchema(personalDataValidationSchema),
    initialValues: {
        email: userStore.user?.email || '',
        userName: userName.value || '',
        phone: phone.value || '',
        address: address.value || '',
    },
});

const onSubmit = handleSubmit(async values => {
    const { email, ...rest } = values;
    loading.value = true;
    const { data, error }: any = await $fetch('/api/user/update-user', {
        method: 'POST',
        body: rest,
    });
    loading.value = false;
    if (error) {
        toastError({
            title: 'Change Personal Data Error',
            description: error.message,
        });
        return;
    }
    userStore.addUser(data);
    toastSuccess({
        title: 'Change Personal Data Success',
        description: 'Personal Data has been changed successfully.',
    });
});
</script>