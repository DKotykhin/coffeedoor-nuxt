/*
  Warnings:

  - You are about to drop the column `sort_description` on the `StoreItem` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "StoreItem" DROP COLUMN "sort_description",
ADD COLUMN     "sort_key" TEXT,
ADD COLUMN     "sort_value" TEXT;
