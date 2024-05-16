import { defineStore } from 'pinia';
import type { User } from '@prisma/client';

export const useUserStore = defineStore('user', {
    state: () => ({
        user: null as User | null,
    }),
    actions: {
        addUser(user: User | null) {
            this.user = user;
        },
        removeUser() {
            this.user = null;
        },
        changeAvatarUrl(url: string) {
            if (this.user) {
                this.user = {
                    ...this.user,
                    avatar: url,
                };
            }
        },
    },
    getters: {
        isLoggedIn(): boolean {
            return !!this.user;
        },
    },
});
