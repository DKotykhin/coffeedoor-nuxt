<template>
    <article class='text-center'>
        <div v-for='item in items' :key='item.slug'>
            {{ categoryTitle }} {{ item.title }}
        </div>
    </article>
</template>

<script setup lang="ts">
import type { StoreItem } from '@prisma/client';

defineProps({
    items: Array as PropType<StoreItem[]>,
    categoryTitle: String
});
</script>