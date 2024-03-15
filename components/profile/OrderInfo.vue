<template>
    <UserHeader />
    <section class='flex flex-col items-center gap-4 my-8'>
        <h2 class='text-2xl font-medium'>
            {{ $t('profile.title') }}
        </h2>
        <div v-if='isLoading'>
            <TheSkeleton />
        </div>
        <div v-else-if='hasOrders' class='flex flex-col items-center'>
            <p class='text-center mb-4'>{{ $t('profile.total') }} {{ res.totalCount }}</p>
            <ProfileOrderTable :orders='res.orders' />
            <UPagination v-model="page" :page-count="ordersOnPage" :total="res.totalCount" />
        </div>
        <p v-else>
            {{ $t('profile.empty') }}
        </p>
    </section>
</template>

<script setup lang="ts">
import type { UserOrdersProps } from '~/server/services/user/getUserOrders';

const ordersOnPage = ref(2)
const page = ref(1)
const res = ref()
const isLoading = ref(false);

const fetchOrders = async (page: number, limit: number): Promise<UserOrdersProps | null> => {
    isLoading.value = true;
    try {
        const response = await $fetch(`/api/user/get-user-orders?limit=${limit}&page=${page}`);
        return response as unknown as UserOrdersProps;
    } catch (error) {
        console.error('Error fetching orders:', error);
        return null;
    } finally {
        isLoading.value = false;
    }
};
res.value = await fetchOrders(page.value, ordersOnPage.value);
const hasOrders = computed(() => res.value?.totalCount > 0);

watch(page, async (newPage) => {
    res.value = await fetchOrders(newPage, ordersOnPage.value);
})
</script>