-- AlterTable
ALTER TABLE "MenuCategory" ALTER COLUMN "updated_at" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "MenuItem" ALTER COLUMN "updated_at" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "StoreCategory" ALTER COLUMN "updated_at" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "StoreItem" ALTER COLUMN "updated_at" SET DEFAULT CURRENT_TIMESTAMP;
