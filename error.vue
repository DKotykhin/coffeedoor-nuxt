<script setup lang="ts">
import type { NuxtError } from '#app'

defineProps({
    error: Object as () => NuxtError
})
const localePath = useLocalePath();
</script>

<template>
    <NuxtLayout>
        <section class='w-full flex flex-col items-center gap-4 mt-6 p-6'>
            <NuxtImg src="/sorry.jpeg" width='400' alt='error' :placeholder="[400, 330]" />
            <h2 class='text-lg text-grey dark:text-grey-200 mt-10'>
                {{ error?.statusCode }} error
            </h2>
            <div class='flex flex-col items-center gap-6'>
                <p class='text-lg text-grey dark:text-grey-200'>
                    {{ error?.message }}
                </p>
                <NuxtLink :to="localePath('/')" class='text-2xl text-mint uppercase font-medium hover:underline'>
                    Main Page
                </NuxtLink>
            </div>
        </section>
    </NuxtLayout>
</template>
