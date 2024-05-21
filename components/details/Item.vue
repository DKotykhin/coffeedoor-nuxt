<template>
    <div>
        <p>Details Page:</p>
        <p class='text-lg font-semibold my-4'>{{ data?.categoryTitle }} {{ data?.storeItem.title }}</p>
        <p>Recommendations list:</p>
        <div v-for='item in data?.recommendationList'>
            <p>{{ data?.categoryTitle }} {{ item.title }}</p>
        </div>
    </div>
</template>

<script setup lang="ts">
import type { StoreItemBySlugProps } from '~/server/services/store/getItemBySlug';

defineProps({
    data: Object as PropType<StoreItemBySlugProps>,
});
</script>