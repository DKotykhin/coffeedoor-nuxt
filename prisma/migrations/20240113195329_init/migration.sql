/*
  Warnings:

  - You are about to drop the column `cathegoty_title_en` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `cathegoty_title_ua` on the `StoreItem` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[token]` on the table `EmailConfirm` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[token]` on the table `ResetPassword` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[slug]` on the table `StoreItem` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "StoreItem" DROP COLUMN "cathegoty_title_en",
DROP COLUMN "cathegoty_title_ua",
ADD COLUMN     "categoty_title_en" TEXT,
ADD COLUMN     "categoty_title_ua" TEXT,
ADD COLUMN     "slug" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "EmailConfirm_token_key" ON "EmailConfirm"("token");

-- CreateIndex
CREATE UNIQUE INDEX "ResetPassword_token_key" ON "ResetPassword"("token");

-- CreateIndex
CREATE UNIQUE INDEX "StoreItem_slug_key" ON "StoreItem"("slug");
