import { defineStore } from 'pinia';
import Cookies from 'js-cookie';

const cookie = Cookies.get('basket');
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
        initializeBasket() {
            if (cookie) {
                this.basket = JSON.parse(cookie);
            }
        },
        addProductToBasket(product: IBasket) {
            const itemIndex = this.basket.findIndex((item: IBasket) => item.slug === product.slug);
            if (itemIndex === -1) {
                this.basket.push(product);
            } else {
                this.basket = this.basket.map((item: IBasket) => {
                    return item.slug === product.slug
                        ? {
                              ...item,
                              quantity: item.quantity + product.quantity,
                          }
                        : item;
                });
            }
            Cookies.set('basket', JSON.stringify(this.basket));
        },
        removeItem(slug: string) {
            this.basket = this.basket.filter((item: IBasket) => item.slug !== slug);
            Cookies.set('basket', JSON.stringify(this.basket));
        },
        quantityDec(slug: string) {
            this.basket = this.basket.map((item: IBasket) => {
                return item.slug === slug
                    ? {
                          ...item,
                          quantity: item.quantity > 1 ? (item.quantity -= 1) : (item.quantity = 1),
                      }
                    : item;
            });
            Cookies.set('basket', JSON.stringify(this.basket));
            return this.basket;
        },
        quantityInc(slug: string) {
            this.basket = this.basket.map((item: IBasket) => {
                return item.slug === slug
                    ? {
                          ...item,
                          quantity: item.quantity + 1,
                      }
                    : item;
            });
            Cookies.set('basket', JSON.stringify(this.basket));
            return this.basket;
        },
        clearBasket() {
            this.basket = [];
            Cookies.remove('basket');
        },
    },
    getters: {
        totalQuantity(): number {
            return this.basket.reduce((acc: number, product: IBasket) => acc + product.quantity, 0);
        },
        totalPrice(): number {
            return this.basket.reduce(
                (acc: number, product: IBasket) => acc + product.price * product.quantity,
                0
            );
        },
        getBasket(): IBasket[] {
            return this.basket;
        },
    },
});
