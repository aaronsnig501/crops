/*
  Warnings:

  - Added the required column `cook` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `grow` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `preserve` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `store` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cook` to the `Crop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `Crop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `grow` to the `Crop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `preserve` to the `Crop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `store` to the `Crop` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cook` to the `Type` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `Type` table without a default value. This is not possible if the table is not empty.
  - Added the required column `grow` to the `Type` table without a default value. This is not possible if the table is not empty.
  - Added the required column `preserve` to the `Type` table without a default value. This is not possible if the table is not empty.
  - Added the required column `store` to the `Type` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Category" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "grow" TEXT NOT NULL,
    "store" TEXT NOT NULL,
    "preserve" TEXT NOT NULL,
    "cook" TEXT NOT NULL
);
INSERT INTO "new_Category" ("id", "name") SELECT "id", "name" FROM "Category";
DROP TABLE "Category";
ALTER TABLE "new_Category" RENAME TO "Category";
CREATE TABLE "new_Crop" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "grow" TEXT NOT NULL,
    "store" TEXT NOT NULL,
    "preserve" TEXT NOT NULL,
    "cook" TEXT NOT NULL,
    CONSTRAINT "Crop_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Crop" ("categoryId", "id", "name") SELECT "categoryId", "id", "name" FROM "Crop";
DROP TABLE "Crop";
ALTER TABLE "new_Crop" RENAME TO "Crop";
CREATE TABLE "new_Type" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "cropId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "grow" TEXT NOT NULL,
    "store" TEXT NOT NULL,
    "preserve" TEXT NOT NULL,
    "cook" TEXT NOT NULL,
    CONSTRAINT "Type_cropId_fkey" FOREIGN KEY ("cropId") REFERENCES "Crop" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_Type" ("cropId", "id", "name") SELECT "cropId", "id", "name" FROM "Type";
DROP TABLE "Type";
ALTER TABLE "new_Type" RENAME TO "Type";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
