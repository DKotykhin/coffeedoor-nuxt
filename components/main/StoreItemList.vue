<template>
    <div v-if='filter.length' class='flex gap-2 min-h-7'>
        <UButton @click='showFilterClick' variant='ghost' icon="i-heroicons-funnel"
            class='mx-4 max-h-7' size='xs' :padded="false" />
        <div v-if='showFilter' class='flex flex-wrap gap-3'>
            <UChip :text="items?.length" size="2xl">
                <UButton :label='allValue' size='xs' :variant="activeFilter === allValue ? 'solid' : 'outline'"
                    :ui="{ rounded: 'rounded-full' }" @click="filterClick(allValue)" />
            </UChip>
            <UChip v-for='item in filter' :key='item' :text="itemQuantity(item)" size="2xl">
                <UButton :label='item' :variant="activeFilter === item ? 'solid' : 'outline'" size='xs'
                    :ui="{ rounded: 'rounded-full' }" @click="filterClick(item)"  />
            </UChip>
        </div>
    </div>
    <div class='flex overflow-auto w-[calc(100vw-16px)] max-w-[1114px] md:flex-wrap md:justify-center gap-4 px-2 py-4'>
        <div v-for='item in filteredItems' :key='item.slug'>
            <MainStoreCard :item='item' :categoryTitle='categoryTitle' />
        </div>
    </div>
</template>

<script setup lang="ts">
import type { StoreItem } from '@prisma/client';

const props = defineProps({
    items: Array as PropType<StoreItem[]>,
    categoryTitle: {
        type: String,
        required: true
    }
});

const allValue = 'all';

const showFilter = ref(false);
const filteredItems = ref(props.items);
const activeFilter = ref(allValue);

const showFilterClick = () => {
    showFilter.value = !showFilter.value;
    filteredItems.value = props.items;
    activeFilter.value = allValue;
};

const filter = computed(() => {
    const filterSet = new Set(props.items?.map((item) => item.sortValue));
    const filterArray = Array.from(filterSet);
    return filterArray.filter((item) => Boolean(item));
});

const itemQuantity = (filterItem: string | null) => {
    return props.items?.filter((item) => item.sortValue === filterItem).length;
};

const filterClick = (filterItem: string | null) => {
    activeFilter.value = filterItem as string;
    if (filterItem === allValue) {
        filteredItems.value = props.items;
    } else {
        filteredItems.value = props.items?.filter((item) => item.sortValue === filterItem);
    }
};

</script>