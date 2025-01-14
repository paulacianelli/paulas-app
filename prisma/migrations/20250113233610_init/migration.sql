/*
  Warnings:

  - You are about to drop the column `addressCity` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `addressStreet` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `addressSuite` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `addressZipcode` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `companyBs` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `companyCatchPhrase` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `companyName` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `geoLat` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `geoLng` on the `User` table. All the data in the column will be lost.
  - Added the required column `address_city` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `address_lat` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `address_lng` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `address_street` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `address_suite` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `address_zipcode` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `company_bs` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `company_catch_phrase` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `company_name` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "website" TEXT NOT NULL,
    "address_street" TEXT NOT NULL,
    "address_suite" TEXT NOT NULL,
    "address_city" TEXT NOT NULL,
    "address_zipcode" TEXT NOT NULL,
    "address_lat" REAL NOT NULL,
    "address_lng" REAL NOT NULL,
    "company_name" TEXT NOT NULL,
    "company_catch_phrase" TEXT NOT NULL,
    "company_bs" TEXT NOT NULL
);
INSERT INTO "new_User" ("email", "id", "name", "phone", "username", "website") SELECT "email", "id", "name", "phone", "username", "website" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
