<template>
    <section id='about' class='px-4'>
        <h4 class='w-full flex justify-center text-3xl md:text-4xl font-semibold mb-3 md:mb-6 uppercase'>
            {{ $t('about.title') }}
        </h4>
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
    </section>
</template>

<script setup lang="ts">
import image_1 from '~/assets/about-images/CoffeeDoor-1.jpg'
import image_2 from '~/assets/about-images/CoffeeDoor-2.jpg'
import image_3 from '~/assets/about-images/CoffeeDoor-3.jpg'
import image_4 from '~/assets/about-images/CoffeeDoor-4.jpg'
import image_5 from '~/assets/about-images/CoffeeDoor-5.jpg'
import image_6 from '~/assets/about-images/CoffeeDoor-6.jpg'
import image_7 from '~/assets/about-images/CoffeeDoor-7.jpg'
import image_8 from '~/assets/about-images/CoffeeDoor-8.jpg'
import image_9 from '~/assets/about-images/CoffeeDoor-9.jpg'
import image_10 from '~/assets/about-images/CoffeeDoor-10.jpg'
import image_11 from '~/assets/about-images/CoffeeDoor-11.jpg'
import image_12 from '~/assets/about-images/CoffeeDoor-12.jpg'
import image_13 from '~/assets/about-images/CoffeeDoor-13.jpg'
import image_14 from '~/assets/about-images/CoffeeDoor-14.jpg'

const images = [
    image_1, image_2, image_3, image_4, image_5, image_6, image_7, image_8, image_9, image_10, image_11, image_12, image_13, image_14
]
</script>
