-- CreateTable
CREATE TABLE "UserOrder" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "delivery_way" TEXT,
    "address" TEXT,
    "comment" TEXT,
    "status" TEXT,
    "total_sum" DOUBLE PRECISION,
    "average_sum" DOUBLE PRECISION,
    "total_quantity" INTEGER,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "UserOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderItem" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "category_title" TEXT NOT NULL,
    "item_title" TEXT,
    "quantity" INTEGER NOT NULL DEFAULT 1,
    "price" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "weight" DOUBLE PRECISION,
    "store_item_id" TEXT NOT NULL,
    "user_order_id" TEXT NOT NULL,

    CONSTRAINT "OrderItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserOrder_user_id_key" ON "UserOrder"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "OrderItem_user_order_id_key" ON "OrderItem"("user_order_id");

-- AddForeignKey
ALTER TABLE "UserOrder" ADD CONSTRAINT "UserOrder_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_user_order_id_fkey" FOREIGN KEY ("user_order_id") REFERENCES "UserOrder"("id") ON DELETE CASCADE ON UPDATE CASCADE;
