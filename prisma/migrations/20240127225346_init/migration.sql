/*
  Warnings:

  - Changed the type of `store_item_id` on the `OrderItem` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "OrderItem" DROP COLUMN "store_item_id",
ADD COLUMN     "store_item_id" INTEGER NOT NULL;
