<template>
    <div class='flex overflow-auto w-[calc(100vw-16px)] max-w-[1114px] md:flex-wrap md:justify-center gap-4 px-2 py-4'>
        <div v-for='item in items' :key='item.slug'>
            <MainStoreCard :item='item' :categoryTitle='categoryTitle' />
        </div>
    </div>
</template>

<script setup lang="ts">
import type { StoreItem } from '@prisma/client';

defineProps({
    items: Array as PropType<StoreItem[]>,
    categoryTitle: { 
        type: String, 
        required: true 
    }
});

</script>