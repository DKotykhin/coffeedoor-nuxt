export const useAppToast = () => {
    const toast = useToast();
    const toastError = ({ title, description }: { title: string; description: string }) => {
        toast.add({
            title,
            description,
            color: 'red',
            icon: 'i-heroicons-x-circle',
        });
    };
    const toastSuccess = ({ title, description }: { title: string; description: string }) => {
        toast.add({
            title,
            description,
            color: 'mint',
            icon: 'i-heroicons-check-circle',
        });
    };
    return { toastError, toastSuccess };
};
