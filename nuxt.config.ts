// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    devtools: { enabled: true },
    css: ['@/assets/css/main.css'],
    modules: ['@nuxtjs/tailwindcss', 'nuxt-icon'],
    app: {
        head: {
            charset: 'utf-8',
            viewport: 'width=device-width, initial-scale=1',
        },
    },
    runtimeConfig: {
        FACEBOOK_URL: process.env.FACEBOOK_URL,
        INSTAGRAM_URL: process.env.INSTAGRAM_URL,
        TELEGRAM_URL: process.env.TELEGRAM_URL,
        EMAIL_LINK: process.env.EMAIL_LINK,
    },
});
