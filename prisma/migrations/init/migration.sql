-- CreateTable
CREATE TABLE "administrator" (
    "id" SERIAL NOT NULL,
    "login" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "backupEmail" TEXT NOT NULL,
    "contactId" INTEGER,

    CONSTRAINT "administrator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "authority" (
    "id" SERIAL NOT NULL,
    "login" TEXT NOT NULL,
    "organizationName" TEXT NOT NULL,
    "organizationDescription" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "authorizedActiveUntil" TIMESTAMP(3) NOT NULL DEFAULT NOW() + interval '1 year',
    "address" TEXT,
    "notes" TEXT,
    "createdByAdministratorId" INTEGER NOT NULL,

    CONSTRAINT "authority_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contact" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "phone" TEXT,
    "text" TEXT,
    "notes" TEXT,
    "authorityId" INTEGER,

    CONSTRAINT "contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "verification" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "comments" TEXT,
    "authorityId" INTEGER,

    CONSTRAINT "verification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "socialUser" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "social_login" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "bio" TEXT,
    "network" VARCHAR(255) NOT NULL,
    "subnetwork" TEXT,
    "createdByAuthorityId" INTEGER NOT NULL,
    "contactId" INTEGER,

    CONSTRAINT "socialUser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "verificationsOnSocialUser" (
    "verificationId" INTEGER NOT NULL,
    "socialUserId" INTEGER NOT NULL,
    "authorityId" INTEGER NOT NULL,
    "assignedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "verificationsOnSocialUser_pkey" PRIMARY KEY ("verificationId","socialUserId","authorityId")
);

-- CreateIndex
CREATE UNIQUE INDEX "administrator_login_key" ON "administrator"("login");

-- CreateIndex
CREATE UNIQUE INDEX "authority_login_key" ON "authority"("login");

-- CreateIndex
CREATE UNIQUE INDEX "socialUser_social_login_key" ON "socialUser"("social_login");

-- AddForeignKey
ALTER TABLE "administrator" ADD CONSTRAINT "administrator_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "contact"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "authority" ADD CONSTRAINT "authority_createdByAdministratorId_fkey" FOREIGN KEY ("createdByAdministratorId") REFERENCES "administrator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contact" ADD CONSTRAINT "contact_authorityId_fkey" FOREIGN KEY ("authorityId") REFERENCES "authority"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "verification" ADD CONSTRAINT "verification_authorityId_fkey" FOREIGN KEY ("authorityId") REFERENCES "authority"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "socialUser" ADD CONSTRAINT "socialUser_createdByAuthorityId_fkey" FOREIGN KEY ("createdByAuthorityId") REFERENCES "authority"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "socialUser" ADD CONSTRAINT "socialUser_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES "contact"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "verificationsOnSocialUser" ADD CONSTRAINT "verificationsOnSocialUser_verificationId_fkey" FOREIGN KEY ("verificationId") REFERENCES "verification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "verificationsOnSocialUser" ADD CONSTRAINT "verificationsOnSocialUser_socialUserId_fkey" FOREIGN KEY ("socialUserId") REFERENCES "socialUser"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "verificationsOnSocialUser" ADD CONSTRAINT "verificationsOnSocialUser_authorityId_fkey" FOREIGN KEY ("authorityId") REFERENCES "authority"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

