-- AlterTable
ALTER TABLE "authority" ALTER COLUMN "authorizedActiveUntil" SET DEFAULT NOW() + interval '1 year';
