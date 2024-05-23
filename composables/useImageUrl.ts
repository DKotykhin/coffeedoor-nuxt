import { Cloudinary } from '@cloudinary/url-gen';

export const useImageUrl = (image : string) => {
    if (!image) {
        return '';
    };
    const runtimeConfig = useRuntimeConfig();
    const cld = new Cloudinary({
        cloud: {
            cloudName: runtimeConfig.app.CLOUDINARY_NAME,
        },
    });
    const img = cld.image(image || '');
    const imageUrl = img.toURL();

    return imageUrl;
};
