<template>
    <block-wrapper>
        <h4 class='text-3xl md:text-[40px] max-w-[700px] text-center font-bold tracking-wide'>
            Our coffee &#8211; Everything matters
        </h4>
        <div class='max-w-[900px] text-grey dark:text-grey-200 mt-10 font-light md:text-lg'>
            <p>{{ $t("about.paragraph_1") }}</p>
            <p class='mt-4'>{{ $t("about.subtitle") }}</p>
            <div ref="target">
                <ul v-if='isVisible' class='mt-4'>
                    <li v-for='(item, index) in benefitItems' :key='index' class='fade-in'
                        :style="{ animationDelay: `${index * 0.8}s` }">
                        <Icon name='material-symbols:done' size='28' class='mr-4 shrink-0' />
                        <p>{{ $t(`about.${item}`) }}</p>
                    </li>
                </ul>
            </div>
            <p class='mt-4'>{{ $t("about.paragraph_2") }}</p>
        </div>
    </block-wrapper>
</template>

<script setup>
const benefitItems = [
    "itemA", "itemB", "itemC", "itemD", "itemE", "itemF",
];
import { useIntersectionObserver } from '@vueuse/core'

const target = ref(null)
const isVisible = ref(false)

useIntersectionObserver(
    target,
    ([{ isIntersecting }]) => {
        isVisible.value = isIntersecting
    },
)
</script>

<style>
.fade-in {
    display: flex;
    margin-bottom: 4px;
    opacity: 0;
    animation: fadeIn 0.5s ease forwards;
}

@keyframes fadeIn {
    0% {
        opacity: 0;
    }

    100% {
        opacity: 1;
    }
}
</style>