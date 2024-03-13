<template>
    <section id='map' class='relative flex flex-col items-center px-4'>
        <div class='flex flex-col items-center w-full max-w-[900px] mb-8'>
            <h4 class='text-3xl md:text-[40px] text-center font-medium tracking-wide text-grey-800 mb-6'>
                {{ $t('about.location') }}
            </h4>
            <MapboxMap map-id="" style="width: 100%; max-width: 700px; height: 500px; position: relative;" :options="{
                style: 'mapbox://styles/mapbox/streets-v11',
                center: [viewport.longitude, viewport.latitude],
                zoom: viewport.zoom,
            }">
                <MapboxDefaultMarker markerId="default-marker" :lnglat="[viewport.longitude, 49.99936]" />
            </MapboxMap>
        </div>
    </section>
</template>

<script setup lang="ts">
const viewport = { latitude: 49.99933, longitude: 36.24208, zoom: 17 };
</script>