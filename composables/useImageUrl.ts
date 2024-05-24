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
    const imageUrl = cld.image(image).toURL();

    return imageUrl;
};
