/*
  Warnings:

  - You are about to drop the column `category` on the `StoreCategory` table. All the data in the column will be lost.
  - You are about to drop the column `category_title` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `item_title` on the `StoreItem` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[title]` on the table `StoreCategory` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `title` to the `StoreCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `title` to the `StoreItem` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "StoreCategory_category_key";

-- AlterTable
ALTER TABLE "StoreCategory" DROP COLUMN "category",
ADD COLUMN     "language_code" "LanguageCode" NOT NULL DEFAULT 'UA',
ADD COLUMN     "title" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "StoreItem" DROP COLUMN "category_title",
DROP COLUMN "item_title",
ADD COLUMN     "title" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "StoreCategory_title_key" ON "StoreCategory"("title");
