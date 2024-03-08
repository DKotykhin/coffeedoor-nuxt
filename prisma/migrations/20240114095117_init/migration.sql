/*
  Warnings:

  - You are about to drop the column `subtitle_en` on the `Menu` table. All the data in the column will be lost.
  - You are about to drop the column `subtitle_ua` on the `Menu` table. All the data in the column will be lost.
  - You are about to drop the column `title_en` on the `Menu` table. All the data in the column will be lost.
  - You are about to drop the column `title_ua` on the `Menu` table. All the data in the column will be lost.
  - You are about to drop the column `description_en` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the column `description_ua` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the column `title_en` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the column `title_ua` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the `CategoryTitle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Country` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Description` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Details` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ItemTitle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SortDescription` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "CategoryTitle" DROP CONSTRAINT "CategoryTitle_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "Country" DROP CONSTRAINT "Country_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "Description" DROP CONSTRAINT "Description_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "Details" DROP CONSTRAINT "Details_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "ItemTitle" DROP CONSTRAINT "ItemTitle_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "SortDescription" DROP CONSTRAINT "SortDescription_store_item_id_fkey";

-- AlterTable
ALTER TABLE "Menu" DROP COLUMN "subtitle_en",
DROP COLUMN "subtitle_ua",
DROP COLUMN "title_en",
DROP COLUMN "title_ua";

-- AlterTable
ALTER TABLE "MenuItem" DROP COLUMN "description_en",
DROP COLUMN "description_ua",
DROP COLUMN "title_en",
DROP COLUMN "title_ua";

-- DropTable
DROP TABLE "CategoryTitle";

-- DropTable
DROP TABLE "Country";

-- DropTable
DROP TABLE "Description";

-- DropTable
DROP TABLE "Details";

-- DropTable
DROP TABLE "ItemTitle";

-- DropTable
DROP TABLE "SortDescription";

-- CreateTable
CREATE TABLE "MenuTitle" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "menu_id" TEXT NOT NULL,

    CONSTRAINT "MenuTitle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MenuSubitle" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "menu_id" TEXT NOT NULL,

    CONSTRAINT "MenuSubitle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MenuItemTitle" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "menu_item_id" TEXT NOT NULL,

    CONSTRAINT "MenuItemTitle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MenuItemDescription" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "menu_item_id" TEXT NOT NULL,

    CONSTRAINT "MenuItemDescription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoreItemCategoryTitle" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "StoreItemCategoryTitle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoreItemItemTitle" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "StoreItemItemTitle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoreItemDescription" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "StoreItemDescription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoreItemDetails" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "StoreItemDetails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoreItemSortDescription" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "StoreItemSortDescription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoreItemCountry" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "ua" TEXT NOT NULL,
    "en" TEXT NOT NULL,
    "store_item_id" TEXT NOT NULL,

    CONSTRAINT "StoreItemCountry_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "MenuTitle_menu_id_key" ON "MenuTitle"("menu_id");

-- CreateIndex
CREATE UNIQUE INDEX "MenuSubitle_menu_id_key" ON "MenuSubitle"("menu_id");

-- CreateIndex
CREATE UNIQUE INDEX "MenuItemTitle_menu_item_id_key" ON "MenuItemTitle"("menu_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "MenuItemDescription_menu_item_id_key" ON "MenuItemDescription"("menu_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "StoreItemCategoryTitle_store_item_id_key" ON "StoreItemCategoryTitle"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "StoreItemItemTitle_store_item_id_key" ON "StoreItemItemTitle"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "StoreItemDescription_store_item_id_key" ON "StoreItemDescription"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "StoreItemDetails_store_item_id_key" ON "StoreItemDetails"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "StoreItemSortDescription_store_item_id_key" ON "StoreItemSortDescription"("store_item_id");

-- CreateIndex
CREATE UNIQUE INDEX "StoreItemCountry_store_item_id_key" ON "StoreItemCountry"("store_item_id");

-- AddForeignKey
ALTER TABLE "MenuTitle" ADD CONSTRAINT "MenuTitle_menu_id_fkey" FOREIGN KEY ("menu_id") REFERENCES "Menu"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MenuSubitle" ADD CONSTRAINT "MenuSubitle_menu_id_fkey" FOREIGN KEY ("menu_id") REFERENCES "Menu"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MenuItemTitle" ADD CONSTRAINT "MenuItemTitle_menu_item_id_fkey" FOREIGN KEY ("menu_item_id") REFERENCES "MenuItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MenuItemDescription" ADD CONSTRAINT "MenuItemDescription_menu_item_id_fkey" FOREIGN KEY ("menu_item_id") REFERENCES "MenuItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreItemCategoryTitle" ADD CONSTRAINT "StoreItemCategoryTitle_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreItemItemTitle" ADD CONSTRAINT "StoreItemItemTitle_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreItemDescription" ADD CONSTRAINT "StoreItemDescription_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreItemDetails" ADD CONSTRAINT "StoreItemDetails_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreItemSortDescription" ADD CONSTRAINT "StoreItemSortDescription_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreItemCountry" ADD CONSTRAINT "StoreItemCountry_store_item_id_fkey" FOREIGN KEY ("store_item_id") REFERENCES "StoreItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;
