import prisma from "../";

import type { Administrator, Contact } from "@/types/database";

export const createAdministrator = async (administrator: Administrator) => {
  const { login, backupEmail, contact } = administrator;
  const data = Object.assign(
    {
      login,
      backupEmail,
    },
    contact
      ? {
          connectOrCreate: {
            where: {
              email: contact.email,
            },
            create: contact,
          },
        }
      : {}
  );

  return await prisma.administrator.create({ data });
};

// export const upsertAdministratorContact = async ({
//   login,
//   contact,
// }: {
//   login: Administrator["login"];
//   contact: Contact;
// }) => {
//   const admin = await prisma.administrator.findUniqueOrThrow({
//     where: {
//       login,
//     },
//   });
//   const upsertedContact = await prisma.contact.upsert({
//     where: {
//       email: contact.email,
//     },
//     update: {
//       ...contact,
//     },
//     create: {
//       ...contact,
//     },
//   });
// };
