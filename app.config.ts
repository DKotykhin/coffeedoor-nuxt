export default defineAppConfig({
    ui: {
        primary: 'mint',
        gray: 'grey',
        accordion: {
            item: {
                padding: 'p-2',
                size: 'text-lg',
                base: 'bg-white dark:bg-gray-800 border-b border-gray-200 dark:border-gray-700',
            },
            default: {
                class: 'bg-white dark:bg-gray-800 text-lg font-semibold text-gray-800 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700',
            },
        },
    },
});
