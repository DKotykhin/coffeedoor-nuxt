-- DropForeignKey
ALTER TABLE "UserOrder" DROP CONSTRAINT "UserOrder_user_id_fkey";

-- AlterTable
ALTER TABLE "UserOrder" ALTER COLUMN "user_id" DROP NOT NULL;
