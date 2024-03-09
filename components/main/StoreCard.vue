<template>
    <article class='text-center'>
        <NuxtLink :to='localePath(`/details/${item.slug}`)' v-for='item in items' :key='item.slug' class='hover:text-mint'>
            <p>{{ categoryTitle }} {{ item.title }}</p>
        </NuxtLink>
    </article>
</template>

<script setup lang="ts">
import type { StoreItem } from '@prisma/client';

const localePath = useLocalePath();

defineProps({
    items: Array as PropType<StoreItem[]>,
    categoryTitle: String
});
</script>