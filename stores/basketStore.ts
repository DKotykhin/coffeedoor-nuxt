import { defineStore } from 'pinia';

export interface IBasket {
    slug: string;
    title: string;
    price: number;
    quantity: number;
    weight: number | null;
    image: string;
    categoryTitle: string;
}

export const useBasketStore = defineStore('basket', {
    state: () => ({
        basket: [] as IBasket[],
    }),
    actions: {
        addProductToBasket(product: IBasket) {
            const itemIndex = this.basket.findIndex((item) => item.slug === product.slug);
            if (itemIndex === -1) {
                this.basket.push(product);
            } else {
                this.basket = this.basket.map((item) => {
                    return item.slug === product.slug
                        ? {
                              ...item,
                              quantity: item.quantity + product.quantity,
                          }
                        : item;
                });
            }
        },
        removeItem(slug: string) {
            this.basket = this.basket.filter((item) => item.slug !== slug);
        },
        quantityDec(slug: string) {
            this.basket = this.basket.map((item) => {
                return item.slug === slug
                    ? {
                          ...item,
                          quantity: item.quantity > 1 ? (item.quantity -= 1) : (item.quantity = 1),
                      }
                    : item;
            });
            return this.basket;
        },
        quantityInc(slug: string) {
            this.basket = this.basket.map((item) => {
                return item.slug === slug
                    ? {
                          ...item,
                          quantity: item.quantity + 1,
                      }
                    : item;
            });
            return this.basket;
        },
        setEmptyBasket() {
            this.basket = [];
        },
    },
    getters: {
        totalQuantity(): number {
            return this.basket.reduce((acc, product) => acc + product.quantity, 0);
        },
        totalPrice(): number {
            return this.basket.reduce((acc, product) => acc + product.price * product.quantity, 0);
        },
        getBasket(): IBasket[] {
            return this.basket;
        }
    },
});
