<template>
    <div class='flex flex-col gap-4 mb-4'>
        <div v-for='(order, index) in orders' :key='index'>
            <UTable :columns="columns" :rows='defineRows(order.orderItems)' />
            <div class='flex justify-between items-center text-sm bg-gray-50 dark:bg-gray-800 p-2'>
                <p class='text-mint'>{{ format(order.createdAt, 'dd MMM yyyy') }}</p>
                <p class='font-semibold'>
                    {{ $t('basket.total') }} {{ order.totalSum }} {{ $t('basket.currency') }}
                </p>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import type { OrderItem } from '@prisma/client';
import { format } from 'date-fns';
import type { UserOrdersFull } from '~/server/services/user/getUserOrders';

defineProps({
    orders: {
        type: Array as PropType<UserOrdersFull[]>,
        required: true
    }
})
const columns = [{
    key: 'title',
    label: 'Title'
}, {
    key: 'qty',
    label: 'Qty'
}, {
    key: 'price',
    label: 'Price'
}, {
    key: 'total',
    label: 'Total'
}]

const defineRows = (order: OrderItem[]) => {
    return order.map(item => ({
        title: item.itemTitle,
        qty: item.quantity,
        price: item.price,
        total: item.quantity * item.price
    }))
}
</script>