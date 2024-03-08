/*
  Warnings:

  - Added the required column `delivery_way` to the `UserOrder` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "DeliveryWay" AS ENUM ('DELIVERY', 'PICKUP');

-- AlterTable
ALTER TABLE "UserOrder" DROP COLUMN "delivery_way",
ADD COLUMN     "delivery_way" "DeliveryWay" NOT NULL;
