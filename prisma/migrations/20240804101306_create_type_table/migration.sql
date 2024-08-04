-- CreateTable
CREATE TABLE "Type" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "cropId" INTEGER NOT NULL,
    CONSTRAINT "Type_cropId_fkey" FOREIGN KEY ("cropId") REFERENCES "Crop" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
