/*
  Warnings:

  - You are about to drop the column `categoty_title_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `categoty_title_ua` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `cathegory` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `country_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `country_ua` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `description_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `description_ua` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `details_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `details_ua` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `item_title_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `item_title_ua` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `sort_description_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `sort_description_ua` on the `StoreItem` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[category]` on the table `StoreItem` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `category` to the `StoreItem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "StoreItem" DROP COLUMN "categoty_title_en",
DROP COLUMN "categoty_title_ua",
DROP COLUMN "cathegory",
DROP COLUMN "country_en",
DROP COLUMN "country_ua",
DROP COLUMN "description_en",
DROP COLUMN "description_ua",
DROP COLUMN "details_en",
DROP COLUMN "details_ua",
DROP COLUMN "item_title_en",
DROP COLUMN "item_title_ua",
DROP COLUMN "sort_description_en",
DROP COLUMN "sort_description_ua",
ADD COLUMN     "category" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "CategoryTitle" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "CategoryTitle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ItemTitle" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "ItemTitle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Description" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "Description_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Details" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "Details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SortDescription" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "SortDescription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CategoryTitle_store_item_id_key" ON "CategoryTitle"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "ItemTitle_store_item_id_key" ON "ItemTitle"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "Description_store_item_id_key" ON "Description"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "Details_store_item_id_key" ON "Details"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "SortDescription_store_item_id_key" ON "SortDescription"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "Country_store_item_id_key" ON "Country"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "StoreItem_category_key" ON "StoreItem"("category");

-- AddForeignKey
ALTER TABLE "CategoryTitle" ADD CONSTRAINT "CategoryTitle_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ItemTitle" ADD CONSTRAINT "ItemTitle_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Description" ADD CONSTRAINT "Description_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Details" ADD CONSTRAINT "Details_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SortDescription" ADD CONSTRAINT "SortDescription_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Country" ADD CONSTRAINT "Country_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;
