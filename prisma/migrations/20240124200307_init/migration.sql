-- AlterTable
ALTER TABLE "StoreItem" ADD COLUMN     "discount" INTEGER,
ADD COLUMN     "is_orderable" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "old_price" DOUBLE PRECISION;
