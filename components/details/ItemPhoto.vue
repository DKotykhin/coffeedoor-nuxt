<template>
     <div class='max-w-[700px] md:w-1/2'>
         <Swiper :modules="[SwiperEffectCreative, SwiperNavigation, SwiperPagination]" :slides-per-view="1"
             :space-between="10" :navigation="true" :pagination="{ dynamicBullets: true }" :effect="'creative'"
             :creativeEffect="{
                 prev: {
                     shadow: true,
                     translate: [0, 0, -400],
                 },
                 next: {
                     translate: ['100%', 0, 0],
                 },
             }">
             <SwiperSlide v-for="(image, index) in images" :key="index">
                 <img :src="image" :alt="`Image ${index + 1}`" class="rounded-lg" />
             </SwiperSlide>
         </Swiper>
     </div>
</template>

<script setup lang="ts">
defineProps({
    images: Array as PropType<string[]>,
});

</script>