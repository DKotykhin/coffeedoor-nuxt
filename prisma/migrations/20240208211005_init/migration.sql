/*
  Warnings:

  - You are about to drop the column `store_item_id` on the `OrderItem` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "OrderItem" DROP COLUMN "store_item_id",
ADD COLUMN     "slug" TEXT;
