/*
  Warnings:

  - You are about to drop the column `image` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the column `category` on the `StoreItem` table. All the data in the column will be lost.
  - Added the required column `store_category_id` to the `StoreItem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "MenuItem" DROP COLUMN "image";

-- AlterTable
ALTER TABLE "StoreItem" DROP COLUMN "category",
ADD COLUMN     "store_category_id" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "StoreCategory" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "category" TEXT NOT NULL,

    CONSTRAINT "StoreCategory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "StoreCategory_category_key" ON "StoreCategory"("category");

-- AddForeignKey
ALTER TABLE "StoreItem" ADD CONSTRAINT "StoreItem_store_category_id_fkey" FOREIGN KEY ("store_category_id") REFERENCES "StoreCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
