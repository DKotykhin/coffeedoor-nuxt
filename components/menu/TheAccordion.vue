<template>
    <section class='w-full flex flex-col items-center px-4'>
        <div class='w-full max-w-[700px] my-8 border rounded-md shadow-md'>
            <UAccordion color="gray" variant="soft" size="lg" :items="items">
                <template #item="{ item }">
                    <div v-for='oneItem in item?.content' class="italic">
                        <div class='flex w-full justify-between px-4'>
                            <p>{{ oneItem.itemName }}</p>
                            <p>{{ oneItem.price }} uah</p>
                        </div>
                    </div>
                </template>
            </UAccordion>
        </div>
    </section>
</template>

<script setup lang="ts">
import type { MenuItem } from '~/types/menu';

const { data } = await useAsyncData('menu', () => $fetch('/api/menu'));

const items = ref(data.value?.body.map((item: any) => (
    {
        label: item.label,
        content: item.items.map((subItem: MenuItem) => (
            {
                itemName: subItem.itemName,
                price: subItem.price,
            }
        ))
    }
)));
</script>
