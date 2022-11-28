/*
  Warnings:

  - You are about to drop the column `login` on the `authority` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `contact` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "authority_login_key";

-- AlterTable
ALTER TABLE "authority" DROP COLUMN "login",
ALTER COLUMN "authorizedActiveUntil" SET DEFAULT NOW() + interval '1 year';

-- CreateIndex
CREATE UNIQUE INDEX "contact_email_key" ON "contact"("email");
