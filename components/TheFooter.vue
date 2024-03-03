<template>
    <footer
        class='w-full flex flex-col gap-1 justify-center items-center h-[260px] bg-grey-800 text-white dark:text-grey-200'>
        <div class='flex gap-10'>
            <a :href="runtimeConfig.public.FACEBOOK_URL" target="_blank" aria-label='Facebook'
                class='hover:-translate-y-1 transition duration-300'>
                <Icon name="mdi:facebook" size='50' />
            </a>
            <a :href="runtimeConfig.public.INSTAGRAM_URL" target="_blank" aria-label='Instagram'
                class='hover:-translate-y-1 transition duration-300'>
                <Icon name="mdi:instagram" size='50' />
            </a>
            <a :href="runtimeConfig.public.TELEGRAM_URL" target="_blank" aria-label='Telegram'
                class='hover:-translate-y-1 transition duration-300'>
                <Icon name="mdi:telegram" size='50' />
            </a>
        </div>
        <div class='flex flex-col items-center gap-4 mt-5'>
            <p>{{ $t('footer.address') }}</p>
            <p>
                {{ $t('footer.phone') }}
                <a :href="runtimeConfig.public.PHONE_LINK" class='hover:underline'>
                    {{ runtimeConfig.public.PHONE }}
                </a>
            </p>
            <p>
                e-mail:
                <a :href="'mailto:' + runtimeConfig.public.EMAIL_LINK" class='hover:underline'>
                    {{ runtimeConfig.public.EMAIL_LINK }}
                </a>
            </p>
        </div>
        <div class='flex justify-between gap-4 w-full max-w-[900px] px-4 md:px-8 mt-3'>
            <p class='text-grey text-sm'>&copy;{{ new Date().getFullYear() }} &nbsp; CoffeeDoor</p>
            <a href='https://www.linkedin.com/in/dmytro-kotykhin-4683151b' target='_blank'
                class='flex gap-1 hover:underline decoration-grey transition duration-300 text-right'>
                <p class='text-grey text-sm'>Powered by <span class='whitespace-nowrap'>Dmytro Kotykhin</span></p>
            </a>
        </div>
    </footer>
</template>

<script setup lang="ts">
const runtimeConfig = useRuntimeConfig()

</script>