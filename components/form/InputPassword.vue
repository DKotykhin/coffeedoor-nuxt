<template>
    <div class='w-full'>
        <label class='text-[14px] text-grey-500'>{{ label }}</label>
        <div class='relative'>
            <UInput v-model="value" :type="(visible ? 'text' : 'password')" :placeholder="placeholder" size='lg'
                :color="(Boolean(errorMessage) ? 'red' : 'white')" />
            <Icon v-if='visible' name="mdi:eye" class='icon' @click='changeVisible' />
            <Icon v-else name="mdi:eye-off" class='icon' @click='changeVisible' />
        </div>
        <p class='text-[14px] text-red-500'>{{ errorMessage }}</p>
    </div>
</template>
  
<script setup>
import { useField } from 'vee-validate';

const visible = ref(false);

const changeVisible = () => {
    visible.value = !visible.value;
};

const props = defineProps({
    name: {
        type: String,
        required: true,
    },
    type: String,
    label: String,
    placeholder: String,
});

const { value, errorMessage } = useField(() => props.name);
</script>

<style scoped>
.icon {
    @apply text-grey-500 absolute top-3 right-4 cursor-pointer;
}

input[type="password"]::-ms-reveal,
input[type="password"]::-ms-clear {
    display: none;
}
</style>