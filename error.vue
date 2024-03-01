<script setup lang="ts">
import type { NuxtError } from '#app'

const props = defineProps({
    error: Object as () => NuxtError
})
const localePath = useLocalePath();
</script>

<template>
    <section class='w-full flex flex-col items-center gap-4 mt-12'>
        <NuxtImg src="/sorry.jpeg" width='400' alt='error' :placeholder="[400, 330]" />
        <h2 class='text-lg text-grey mt-10'>Error: {{ error?.statusCode }}</h2>
        <div class='flex flex-col items-center gap-6'>
            <p class='text-lg text-grey'>
                Page not found...
            </p>
            <NuxtLink :to="localePath('/')" class='text-2xl text-mint uppercase font-medium hover:underline'>
                Main Page
            </NuxtLink>
        </div>
    </section>
</template>
