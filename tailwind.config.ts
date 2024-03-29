import type { Config } from 'tailwindcss';

export default <Partial<Config>>{
    content: [],
    theme: {
        extend: {
            colors: {
                mint: {
                    DEFAULT: '#00a1b6',
                    50: '#ebfffd',
                    100: '#cdfffe',
                    200: '#a1fdff',
                    300: '#60faff',
                    400: '#00cede',
                    500: '#00a1b6',
                    600: '#088296',
                    700: '#10687a',
                    800: '#125767',
                    900: '#053947',
                    950: '#021e2b',
                },
                grey: {
                    DEFAULT: '#808080',
                    50: '#f2f2f2',
                    100: '#e6e6e6',
                    200: '#cccccc',
                    300: '#b3b3b3',
                    400: '#999999',
                    500: '#808080',
                    600: '#666666',
                    700: '#4d4d4d',
                    800: '#333333',
                    900: '#1a1a1a',
                    950: '#0d0d0d',
                },
                brown: {
                    50: '#fbf5f5',
                    100: '#f7eae9',
                    200: '#f0d9d8',
                    300: '#e5bebc',
                    400: '#d49895',
                    500: '#c17572',
                    600: '#ab5b57',
                    700: '#8f4946',
                    800: '#773f3d',
                    900: '#683b39',
                    950: '#351b1a',
                },
            },
        },
    },
    darkMode: 'class',
    plugins: [],
};
