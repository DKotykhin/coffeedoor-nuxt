<template>
    <section class="flex justify-center w-full">
        <div class="flex justify-center max-w-[1440px] w-full my-2 md:my-4">
            <div
                class='flex flex-col items-center gap-5 max-w-[500px] px-4 py-8 m-4 w-full border rounded-xl border-grey-100'>
                <slot />
            </div>
        </div>
    </section>
</template>