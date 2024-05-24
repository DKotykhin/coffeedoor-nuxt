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
        <p v-else-if='res?.totalCount === 0'>
            {{ $t('profile.empty') }}
        </p>
    </section>
</template>

<script setup lang="ts">
import type { UserOrdersProps } from '~/server/services/user/getUserOrders';

const router = useRouter();
const { toastError } = useAppToast();
const { path, query } = router.currentRoute.value;
const ordersOnPage = ref(2)
const page = ref(router.currentRoute.value.query.page ? Number(router.currentRoute.value.query.page) : 1);
const res = ref()
const isLoading = ref(false);

const fetchOrders = async (page: number, limit: number): Promise<UserOrdersProps | null> => {
    isLoading.value = true;
    try {
        const response = await $fetch(`/api/user/get-user-orders?limit=${limit}&page=${page}`);
        if (true) {
            router.push({ path, query: { ...query, page } });
        }
        return response as unknown as UserOrdersProps;
    } catch (error: any) {
        toastError({
            title: 'Error fetching orders',
            description: error.message,
        })
        return null;
    } finally {
        isLoading.value = false;
    }
};
onMounted(async () => {
    res.value = await fetchOrders(page.value, ordersOnPage.value);
});
const hasOrders = computed(() => res.value?.totalCount > 0);

watch(page, async (newPage) => {
    res.value = await fetchOrders(newPage, ordersOnPage.value);
})
</script>