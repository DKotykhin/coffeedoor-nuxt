import { useUserStore } from '~/stores/userStore';

export default defineNuxtRouteMiddleware((to, from) => {
    // const userStore = useUserStore();
    const token = useCookie('token');
    if (!token.value && to.path === '/profile') {
        return navigateTo('/');
    }
    // if (userStore.user && to.path === '/auth/sign-in') {
    //     return navigateTo('/');
    // }
    // if (userStore.user && to.path === '/auth/sign-up') {
    //     return navigateTo('/');
    // }
});

