/*
  Warnings:

  - You are about to drop the column `expiredat` on the `EmailConfirm` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "EmailConfirm" DROP COLUMN "expiredat",
ADD COLUMN     "expiredAt" TIMESTAMP(3);
