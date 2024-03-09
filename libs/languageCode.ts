import { LanguageCode } from '@/node_modules/.prisma/client';

export const languageCode = (lang: string): LanguageCode => {
    let language_code;
    switch (lang) {
        case 'ua':
            language_code = LanguageCode.UA;
            break;
        case 'en':
            language_code = LanguageCode.EN;
            break;
        default:
            language_code = LanguageCode.UA;
    }

    return language_code;
};
