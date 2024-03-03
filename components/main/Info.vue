<template>
    <block-wrapper>
        <div class='flex flex-col items-center justify-center gap-8 w-full mb-12'>
            <h2
                class='text-3xl md:text-[40px] leading-normal md:leading-normal max-w-[500px] text-center font-bold tracking-wide'>
                {{ $t("info.title") }}
            </h2>
            <h4 class='text-lg md:text-2xl leading-relaxed md:leading-relaxed max-w-[700px] text-center'>
                {{ $t("info.subtitle") }}
            </h4>
        </div>
        <div class='flex flex-col gap-8 max-w-[700px]'>
            <div class='flex items-start gap-6 md:gap-8'>
                <Icon name="mdi:clock-outline" size='50' class='shrink-0' />
                <div>
                    <p class='text-xl md:text-2xl mb-2 font-semibold'>{{ $t("info.openTimesTitle") }}</p>
                    <p class='md:text-lg font-light text-grey-700 dark:text-grey-200'>{{ $t("info.openTimes_1") }}</p>
                    <p class='md:text-lg font-light text-grey-700 dark:text-grey-200'>{{ $t("info.openTimes_2") }}</p>
                </div>
            </div>
            <div class='flex items-start gap-6 md:gap-8'>
                <Icon name="mdi:truck-delivery-outline" size='50' class='shrink-0' />
                <div>
                    <p class='text-xl md:text-2xl mb-2 font-semibold'>{{ $t("info.deliveryTitle") }}</p>
                    <p class='md:text-lg font-light text-grey-700 dark:text-grey-200'>{{ $t("info.deliveryOptions") }}</p>
                </div>
            </div>
            <div class='flex items-start gap-6 md:gap-8'>
                <Icon name="mdi:map-marker-circle" size='50' class='shrink-0' />
                <div>
                    <p class='text-xl md:text-2xl mb-2 font-semibold'>{{ $t("info.contactsTitle") }}</p>
                    <p class='md:text-lg font-light text-grey-700 dark:text-grey-200'>{{ $t("info.address") }}</p>
                    <p class='md:text-lg font-light text-grey-700 dark:text-grey-200'>
                        {{ $t('info.phone') }}
                        <a :href="runtimeConfig.public.PHONE_LINK" class='hover:underline'>
                            {{ runtimeConfig.public.PHONE }}
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </block-wrapper>
</template>

<script setup lang="ts">
const runtimeConfig = useRuntimeConfig()
</script>