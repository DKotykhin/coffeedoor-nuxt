export interface Menu {
    id: number;
    label: string;
    items: MenuItem[];
}

export interface MenuItem {
    id: number;
    itemName: string;
    description: string;
    price: number;
}