/*
  Warnings:

  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "name",
ADD COLUMN     "address" TEXT,
ADD COLUMN     "userName" TEXT;

-- CreateTable
CREATE TABLE "EmailConfirm" (
    "id" TEXT NOT NULL,
    "token" TEXT,
    "expire" TIMESTAMP(3),
    "verified" BOOLEAN DEFAULT false,
    "userId" TEXT NOT NULL,

    CONSTRAINT "EmailConfirm_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Menu" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title_ua" TEXT,
    "title_en" TEXT,
    "subtitle_ua" TEXT,
    "subtitle_en" TEXT,
    "hidden" BOOLEAN NOT NULL DEFAULT false,
    "position" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Menu_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MenuItem" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title_ua" TEXT,
    "title_en" TEXT,
    "description_ua" TEXT,
    "description_en" TEXT,
    "price" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "image" TEXT,
    "hidden" BOOLEAN NOT NULL DEFAULT false,
    "menuId" TEXT NOT NULL,

    CONSTRAINT "MenuItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StoreItem" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "cathegotyTitle_ua" TEXT,
    "cathegotyTitle_en" TEXT,
    "itemTitle_ua" TEXT,
    "itemTitle_en" TEXT,
    "description_ua" TEXT,
    "description_en" TEXT,
    "details_ua" TEXT,
    "details_en" TEXT,
    "sortDescription_ua" TEXT,
    "sortDescription_en" TEXT,
    "tm" TEXT,
    "country_ua" TEXT,
    "country_en" TEXT,
    "price" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "weight" DOUBLE PRECISION,
    "images" TEXT[],
    "hidden" BOOLEAN NOT NULL DEFAULT false,
    "cathegory" TEXT,
    "position" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "StoreItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "EmailConfirm_userId_key" ON "EmailConfirm"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "MenuItem_menuId_key" ON "MenuItem"("menuId");

-- AddForeignKey
ALTER TABLE "EmailConfirm" ADD CONSTRAINT "EmailConfirm_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MenuItem" ADD CONSTRAINT "MenuItem_menuId_fkey" FOREIGN KEY ("menuId") REFERENCES "Menu"("id") ON DELETE CASCADE ON UPDATE CASCADE;
