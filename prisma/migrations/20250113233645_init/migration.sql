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
    "address_lat" TEXT NOT NULL,
    "address_lng" TEXT NOT NULL,
    "company_name" TEXT NOT NULL,
    "company_catch_phrase" TEXT NOT NULL,
    "company_bs" TEXT NOT NULL
);
INSERT INTO "new_User" ("address_city", "address_lat", "address_lng", "address_street", "address_suite", "address_zipcode", "company_bs", "company_catch_phrase", "company_name", "email", "id", "name", "phone", "username", "website") SELECT "address_city", "address_lat", "address_lng", "address_street", "address_suite", "address_zipcode", "company_bs", "company_catch_phrase", "company_name", "email", "id", "name", "phone", "username", "website" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
