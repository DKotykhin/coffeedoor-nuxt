<template>
    <ClientOnly>
        <button @click='toggleMode' class='absolute top-[18px] md:top-5 right-6'>
            <UTooltip :text="lightMode ? 'switch to dark' : 'switch to light'">
                <Icon v-if="lightMode" name="mdi:weather-sunny" size='20' />
                <Icon v-if="darkMode" name="mdi:moon-waning-crescent" size='20' />
                <Icon v-if="colorMode.value === 'system'" name="mdi:sun-angle-outline" />
            </UTooltip>
        </button>
    </ClientOnly>
</template>

<script setup lang="ts">
const colorMode = useColorMode();
const lightMode = computed(() => colorMode.value === 'light');
const darkMode = computed(() => colorMode.value === 'dark');

function toggleMode() {
    if (colorMode.value === 'dark') {
        colorMode.preference = 'light'
    } else {
        colorMode.preference = 'dark'
    }
};
// definePageMeta({
//   colorMode: 'light'
// }) 
</script>