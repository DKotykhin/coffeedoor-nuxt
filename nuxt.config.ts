import { createRequire } from 'module';

const prismaClientPath = createRequire(import.meta.url).resolve('@prisma/client');

export default defineNuxtConfig({
    devtools: { enabled: true },
    css: ['@/assets/css/main.css'],
    modules: [
        '@nuxt/ui',
        '@nuxtjs/i18n',
        '@vueuse/nuxt',
        '@nuxt/image',
        'nuxt-swiper',
        '@vee-validate/nuxt',
        '@pinia/nuxt',
    ],
    app: {
        head: {
            charset: 'utf-8',
            viewport: 'width=device-width, initial-scale=1',
        },
        pageTransition: {
            name: 'page',
            mode: 'out-in',
        },
    },
    router: {
        options: {
            scrollBehaviorType: 'smooth',
        },
    },
    i18n: {
        locales: [
            {
                code: 'ua',
                file: 'ua.ts',
                iso: 'uk-UA',
                name: 'Ua',
            },
            {
                code: 'en',
                file: 'en.ts',
                iso: 'en-US',
                name: 'En',
            },
        ],
        defaultLocale: 'ua',
        langDir: 'lang/',
        strategy: 'prefix_except_default',
        detectBrowserLanguage: false,
        vueI18n: './i18n.config.ts',
    },
    runtimeConfig: {
        public: {
            FACEBOOK_URL: process.env.FACEBOOK_URL,
            INSTAGRAM_URL: process.env.INSTAGRAM_URL,
            TELEGRAM_URL: process.env.TELEGRAM_URL,
            EMAIL_LINK: process.env.EMAIL_LINK,
            PHONE: process.env.PHONE,
            PHONE_LINK: process.env.PHONE_LINK,
        },
    },
    colorMode: {
        preference: 'system', // default value of $colorMode.preference
        fallback: 'light', // fallback value if not system preference found
        classSuffix: '',
    },
    vite: {
        resolve: {
            alias: {
                '.prisma/client/index-browser': prismaClientPath.replace(
                    '@prisma/client/default.js',
                    '.prisma/client/index-browser.js'
                ),
            },
        },
    },
});
