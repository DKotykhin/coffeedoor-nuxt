/*
  Warnings:

  - The primary key for the `StoreItem` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `StoreItem` table. All the data in the column will be lost.
  - You are about to drop the column `is_orderable` on the `StoreItem` table. All the data in the column will be lost.
  - Made the column `slug` on table `StoreItem` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX "StoreItem_slug_key";

-- AlterTable
ALTER TABLE "StoreItem" DROP CONSTRAINT "StoreItem_pkey",
DROP COLUMN "id",
DROP COLUMN "is_orderable",
ADD COLUMN     "to_order" BOOLEAN NOT NULL DEFAULT false,
ALTER COLUMN "slug" SET NOT NULL,
ADD CONSTRAINT "StoreItem_pkey" PRIMARY KEY ("slug");
