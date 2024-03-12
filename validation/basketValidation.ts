import { z } from 'zod';

import { phone, areaTextField, textFieldRequired } from '@/validation/_fields';
import { DeliveryWay } from '@prisma/client';

export const basketFormValidationSchema = z.object({
    userName: textFieldRequired,
    phone,
    deliveryWay: z.enum([DeliveryWay.DELIVERY, DeliveryWay.PICKUP]),
    comment: areaTextField,
});
export type BasketFormTypes = z.infer<typeof basketFormValidationSchema>;
