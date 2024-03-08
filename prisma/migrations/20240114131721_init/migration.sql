/*
  Warnings:

  - The primary key for the `MenuItem` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `MenuItem` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `StoreItem` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `StoreItem` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `userName` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Menu` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MenuItemDescription` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MenuItemTitle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MenuSubitle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MenuTitle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StoreItemCategoryTitle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StoreItemCountry` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StoreItemDescription` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StoreItemDetails` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StoreItemItemTitle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `StoreItemSortDescription` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `language_code` to the `MenuItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category_title` to the `StoreItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `language_code` to the `StoreItem` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "LanguageCode" AS ENUM ('UA', 'EN');

-- DropForeignKey
ALTER TABLE "MenuItem" DROP CONSTRAINT "MenuItem_menu_id_fkey";

-- DropForeignKey
ALTER TABLE "MenuItemDescription" DROP CONSTRAINT "MenuItemDescription_menu_item_id_fkey";

-- DropForeignKey
ALTER TABLE "MenuItemTitle" DROP CONSTRAINT "MenuItemTitle_menu_item_id_fkey";

-- DropForeignKey
ALTER TABLE "MenuSubitle" DROP CONSTRAINT "MenuSubitle_menu_id_fkey";

-- DropForeignKey
ALTER TABLE "MenuTitle" DROP CONSTRAINT "MenuTitle_menu_id_fkey";

-- DropForeignKey
ALTER TABLE "StoreItemCategoryTitle" DROP CONSTRAINT "StoreItemCategoryTitle_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "StoreItemCountry" DROP CONSTRAINT "StoreItemCountry_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "StoreItemDescription" DROP CONSTRAINT "StoreItemDescription_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "StoreItemDetails" DROP CONSTRAINT "StoreItemDetails_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "StoreItemItemTitle" DROP CONSTRAINT "StoreItemItemTitle_store_item_id_fkey";

-- DropForeignKey
ALTER TABLE "StoreItemSortDescription" DROP CONSTRAINT "StoreItemSortDescription_store_item_id_fkey";

-- DropIndex
DROP INDEX "StoreItem_category_key";

-- AlterTable
ALTER TABLE "MenuItem" DROP CONSTRAINT "MenuItem_pkey",
ADD COLUMN     "description" TEXT,
ADD COLUMN     "language_code" "LanguageCode" NOT NULL,
ADD COLUMN     "title" TEXT,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "MenuItem_pkey" PRIMARY KEY ("id", "language_code");

-- AlterTable
ALTER TABLE "StoreItem" DROP CONSTRAINT "StoreItem_pkey",
ADD COLUMN     "category_title" TEXT NOT NULL,
ADD COLUMN     "country" TEXT,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "details" TEXT,
ADD COLUMN     "item_title" TEXT,
ADD COLUMN     "language_code" "LanguageCode" NOT NULL,
ADD COLUMN     "sort_description" TEXT,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "StoreItem_pkey" PRIMARY KEY ("id", "language_code");

-- AlterTable
ALTER TABLE "User" DROP COLUMN "userName",
ADD COLUMN     "user_name" TEXT;

-- DropTable
DROP TABLE "Menu";

-- DropTable
DROP TABLE "MenuItemDescription";

-- DropTable
DROP TABLE "MenuItemTitle";

-- DropTable
DROP TABLE "MenuSubitle";

-- DropTable
DROP TABLE "MenuTitle";

-- DropTable
DROP TABLE "StoreItemCategoryTitle";

-- DropTable
DROP TABLE "StoreItemCountry";

-- DropTable
DROP TABLE "StoreItemDescription";

-- DropTable
DROP TABLE "StoreItemDetails";

-- DropTable
DROP TABLE "StoreItemItemTitle";

-- DropTable
DROP TABLE "StoreItemSortDescription";

-- CreateTable
CREATE TABLE "MenuCategory" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "title_ua" TEXT NOT NULL,
    "title_en" TEXT NOT NULL,
    "description_ua" TEXT,
    "description_en" TEXT,
    "image" TEXT,
    "hidden" BOOLEAN NOT NULL DEFAULT false,
    "position" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "MenuCategory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MenuItem" ADD CONSTRAINT "MenuItem_menu_id_fkey" FOREIGN KEY ("menu_id") REFERENCES "MenuCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;
