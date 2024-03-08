/*
  Warnings:

  - You are about to drop the column `expire` on the `EmailConfirm` table. All the data in the column will be lost.
  - You are about to drop the column `changed` on the `ResetPassword` table. All the data in the column will be lost.
  - You are about to drop the column `expire` on the `ResetPassword` table. All the data in the column will be lost.
  - Made the column `verified` on table `EmailConfirm` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "EmailConfirm" DROP COLUMN "expire",
ADD COLUMN     "expiredat" TIMESTAMP(3),
ALTER COLUMN "verified" SET NOT NULL;

-- AlterTable
ALTER TABLE "ResetPassword" DROP COLUMN "changed",
DROP COLUMN "expire",
ADD COLUMN     "changedAt" TIMESTAMP(3),
ADD COLUMN     "expiredAt" TIMESTAMP(3);
