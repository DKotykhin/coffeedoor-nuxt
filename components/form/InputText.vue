<template>
    <div class='w-full'>
        <label class='text-[14px] text-grey-500'>{{ label }}</label>
        <input v-model="value" type="text" :placeholder="placeholder"
            :class="[Boolean(errorMessage) ? 'input border-red-500' : 'input border-grey-300']" />
        <p class='text-[14px] text-red-500'>{{ errorMessage }}</p>
    </div>
</template>
  
<script setup>
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

<style scoped>
.input {
    @apply w-full border rounded-md p-2 mt-1;
}
</style>