export default defineAppConfig({
    ui: {
        primary: 'mint',
        gray: 'grey',
        accordion: {
            item: {
                padding: 'p-2',
                size: 'text-lg',
            },
            default: {
                class: 'bg-white dark:bg-gray-800 text-lg font-semibold text-gray-800 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700',
            },
        },
    },
});
