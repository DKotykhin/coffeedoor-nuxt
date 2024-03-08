/*
  Warnings:

  - You are about to drop the column `expiredAt` on the `EmailConfirm` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `EmailConfirm` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Menu` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Menu` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the column `menuId` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `MenuItem` table. All the data in the column will be lost.
  - You are about to drop the column `changedAt` on the `ResetPassword` table. All the data in the column will be lost.
  - You are about to drop the column `expiredAt` on the `ResetPassword` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `ResetPassword` table. All the data in the column will be lost.
  - You are about to drop the column `cathegotyTitle_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `cathegotyTitle_ua` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `itemTitle_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `itemTitle_ua` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `sortDescription_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `sortDescription_ua` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `passwordHash` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_id]` on the table `EmailConfirm` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[menu_id]` on the table `MenuItem` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[user_id]` on the table `ResetPassword` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `user_id` to the `EmailConfirm` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Menu` table without a default value. This is not possible if the table is not empty.
  - Added the required column `menu_id` to the `MenuItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `MenuItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `ResetPassword` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `StoreItem` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "EmailConfirm" DROP CONSTRAINT "EmailConfirm_userId_fkey";

-- DropForeignKey
ALTER TABLE "MenuItem" DROP CONSTRAINT "MenuItem_menuId_fkey";

-- DropForeignKey
ALTER TABLE "ResetPassword" DROP CONSTRAINT "ResetPassword_userId_fkey";

-- DropIndex
DROP INDEX "EmailConfirm_userId_key";

-- DropIndex
DROP INDEX "MenuItem_menuId_key";

-- DropIndex
DROP INDEX "ResetPassword_userId_key";

-- AlterTable
ALTER TABLE "EmailConfirm" DROP COLUMN "expiredAt",
DROP COLUMN "userId",
ADD COLUMN     "expired_at" TIMESTAMP(3),
ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Menu" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "MenuItem" DROP COLUMN "createdAt",
DROP COLUMN "menuId",
DROP COLUMN "updatedAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "menu_id" TEXT NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "ResetPassword" DROP COLUMN "changedAt",
DROP COLUMN "expiredAt",
DROP COLUMN "userId",
ADD COLUMN     "changed_at" TIMESTAMP(3),
ADD COLUMN     "expired_at" TIMESTAMP(3),
ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "StoreItem" DROP COLUMN "cathegotyTitle_en",
DROP COLUMN "cathegotyTitle_ua",
DROP COLUMN "createdAt",
DROP COLUMN "itemTitle_en",
DROP COLUMN "itemTitle_ua",
DROP COLUMN "sortDescription_en",
DROP COLUMN "sortDescription_ua",
DROP COLUMN "updatedAt",
ADD COLUMN     "cathegoty_title_en" TEXT,
ADD COLUMN     "cathegoty_title_ua" TEXT,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "item_title_en" TEXT,
ADD COLUMN     "item_title_ua" TEXT,
ADD COLUMN     "sort_description_en" TEXT,
ADD COLUMN     "sort_description_ua" TEXT,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "createdAt",
DROP COLUMN "passwordHash",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "password_hash" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "EmailConfirm_user_id_key" ON "EmailConfirm"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "MenuItem_menu_id_key" ON "MenuItem"("menu_id");

-- CreateIndex
CREATE UNIQUE INDEX "ResetPassword_user_id_key" ON "ResetPassword"("user_id");

-- AddForeignKey
ALTER TABLE "ResetPassword" ADD CONSTRAINT "ResetPassword_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailConfirm" ADD CONSTRAINT "EmailConfirm_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MenuItem" ADD CONSTRAINT "MenuItem_menu_id_fkey" FOREIGN KEY ("menu_id") REFERENCES "Menu"("id") ON DELETE CASCADE ON UPDATE CASCADE;
