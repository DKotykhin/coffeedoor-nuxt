<template>
    <ClientOnly>
        <button @click='toggleMode' class='absolute top-1 right-6'>
            <Icon v-if="colorMode.value === 'dark'" name="mdi:moon-waning-crescent" size='20' />
            <Icon v-if="colorMode.value === 'light'" name="mdi:weather-sunny" size='20' />
            <Icon v-if="colorMode.value === 'system'" name="mdi:sun-angle-outline" />
        </button>
    </ClientOnly>
</template>
  
<script setup lang="ts">
const colorMode = useColorMode()

function toggleMode() {
    if (colorMode.value === 'dark') {
        colorMode.preference = 'light'
    } else {
        colorMode.preference = 'dark'
    }
}
// definePageMeta({
//   colorMode: 'light'
// }) 
</script>  