<template>
    <block-wrapper>
        <h1 class='text-[24px] font-semibold mb-2'>
            {{ $t('top.button_3') }}
        </h1>
        <ClientOnly>
            <UAvatar :src="avatarUrl" :alt="userStore.user?.userName || 'avatar'" icon="i-heroicons-user-16-solid"
                size='2xl' class='my-4' />
        </ClientOnly>
        <div>
            <UFormGroup label='New avatar' name='avatar'>
                <UInput type='file' accept='image/*' ref='fileInput' />
            </UFormGroup>
        </div>
        <UButton variant="solid" :label="$t('top.button_3')" :loading="loading" :disabled="loading" @click="saveAvatar"
            class='my-4' />
        <TheLink to="/profile" />
    </block-wrapper>
</template>

<script setup lang="ts">
const userStore = useUserStore();
const { toastError, toastSuccess } = useAppToast();

const loading = ref(false);
const fileInput = ref(null);
const avatarUrl = ref('');

const userAvatar = computed(() => userStore.user?.avatar);

const saveAvatar = async () => {
    loading.value = true;
    const file = ((fileInput.value as any)?.input?.files[0] as File) || null;
    if (!file) {
        loading.value = false;
        toastError({
            title: 'Upload avatar',
            description: 'Please select an image file',
        });
        return;
    }
    const fd = new FormData();
    fd.append('avatar', file);
    const { data, error }: any = await $fetch('/api/user/upload-avatar', {
        method: 'POST',
        body: fd,
    });
    loading.value = false;
    if (error) {
        toastError({
            title: 'Upload avatar',
            description: error.message,
        });
        return;
    }
    toastSuccess({
        title: 'Upload avatar',
        description: 'Avatar has been updated successfully',
    });
    (fileInput.value as any).input.value = null;
    userStore.changeAvatarUrl(data.avatar);
};
watch(userAvatar, () => {
    avatarUrl.value = useImageUrl(userAvatar.value || '');
}, { immediate: true });
</script>