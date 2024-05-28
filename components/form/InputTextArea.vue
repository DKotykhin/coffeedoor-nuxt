<template>
    <div class='w-full'>
        <label class='text-[14px] text-grey-500 dark:text-grey-200'>{{ label }}</label>
        <UTextarea v-model="value" type="text" :placeholder="placeholder" variant="outline" :rows="3"
            :color="(Boolean(errorMessage) ? 'red' : 'white')" />
        <p class='text-[14px] text-red-500'>{{ errorMessage }}</p>
    </div>
</template>
  
<script setup lang='ts'>
import { useField } from 'vee-validate';

const props = defineProps({
    name: {
        type: String,
        required: true,
    },
    label: String,
    placeholder: String,
});

const { value, errorMessage } = useField(() => props.name);
</script>