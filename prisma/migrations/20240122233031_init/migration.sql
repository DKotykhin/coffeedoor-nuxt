-- AlterTable
ALTER TABLE "MenuItem" ALTER COLUMN "price" DROP NOT NULL,
ALTER COLUMN "price" DROP DEFAULT,
ALTER COLUMN "price" SET DATA TYPE TEXT;