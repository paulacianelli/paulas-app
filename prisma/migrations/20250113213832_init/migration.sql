/*
  Warnings:

  - Added the required column `addressCity` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `addressStreet` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `addressSuite` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `addressZipcode` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `companyBs` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `companyCatchPhrase` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `companyName` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `geoLat` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `geoLng` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phone` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `website` to the `User` table without a default value. This is not possible if the table is not empty.

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
    "addressStreet" TEXT NOT NULL,
    "addressSuite" TEXT NOT NULL,
    "addressCity" TEXT NOT NULL,
    "addressZipcode" TEXT NOT NULL,
    "geoLat" REAL NOT NULL,
    "geoLng" REAL NOT NULL,
    "companyName" TEXT NOT NULL,
    "companyCatchPhrase" TEXT NOT NULL,
    "companyBs" TEXT NOT NULL
);
INSERT INTO "new_User" ("email", "id", "name") SELECT "email", "id", "name" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
