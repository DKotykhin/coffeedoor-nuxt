/*
  Warnings:

  - You are about to drop the column `description_en` on the `MenuCategory` table. All the data in the column will be lost.
  - You are about to drop the column `description_ua` on the `MenuCategory` table. All the data in the column will be lost.
  - You are about to drop the column `title_en` on the `MenuCategory` table. All the data in the column will be lost.
  - You are about to drop the column `title_ua` on the `MenuCategory` table. All the data in the column will be lost.
  - Added the required column `title` to the `MenuCategory` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "MenuCategory" DROP COLUMN "description_en",
DROP COLUMN "description_ua",
DROP COLUMN "title_en",
DROP COLUMN "title_ua",
ADD COLUMN     "description" TEXT,
ADD COLUMN     "language_code" "LanguageCode" NOT NULL DEFAULT 'UA',
ADD COLUMN     "title" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "MenuItem" ALTER COLUMN "language_code" SET DEFAULT 'UA';

-- AlterTable
ALTER TABLE "StoreItem" ALTER COLUMN "language_code" SET DEFAULT 'UA';
