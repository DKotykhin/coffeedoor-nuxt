<template>
    <div class='w-full flex flex-col items-center my-4'>
        <p class='w-full max-w-[500px] text-xl text-center'>
            {{ $t('basket.details') }}
        </p>
        <form @submit="onSubmit" class='w-full max-w-[500px] flex flex-col gap-4 mt-4'>
            <FormInputText name="userName" :placeholder="$t('basket.userNamePlaceholder')" :label="$t('basket.userName')" />
            <FormInputText name="phone" :placeholder="$t('basket.phonePlaceholder')" :label="$t('basket.phone')" />
            <FormInputTextArea name="comment" :placeholder="$t('basket.commentPlaceholder')"
                :label="$t('basket.comment')" />
            <FormInputRadioGroup name="deliveryWay" :legend="$t('basket.deliveryTitle')" :options="[
                { label: $t('basket.pickup'), value: DeliveryWay.PICKUP },
                { label: $t('basket.delivery'), value: DeliveryWay.DELIVERY },
            ]" />
            <UButton block size='lg' type='submit' icon="i-heroicons-shopping-bag" class='mt-2 mb-6'>
                {{ $t('basket.submit') }}
            </UButton>
        </form>
    </div>
</template>

<script setup lang='ts'>
import { DeliveryWay } from '@prisma/client/wasm';
import { useForm } from 'vee-validate';
import { toTypedSchema } from '@vee-validate/zod';
import { basketFormValidationSchema } from '@/validation/basketValidation';

const { handleSubmit } = useForm({
    validationSchema: toTypedSchema(basketFormValidationSchema),
    initialValues: {
        userName: '',
        phone: '',
        comment: '',
        deliveryWay: DeliveryWay.PICKUP,
    },
});

const emit = defineEmits(['submit-event']);

const onSubmit = handleSubmit(values => {
    emit('submit-event', values);
});

</script>