<template>
    <div class='w-full'>
        <URadioGroup v-model="value" :legend='legend' :options="options" />
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
    options: {
        type: Array,
        required: true,
    },
    legend: String,
});

const { value, errorMessage } = useField(() => props.name);
</script>