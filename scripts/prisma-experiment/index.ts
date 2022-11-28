import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

async function createTestAdmin() {
  return await prisma.administrator.create({
    data: {
      login: "kerry.ann.boyko@gmail.com",
      backupEmail: "kerry.ann.boyko@gmail.com",
      contact: {
        create: {
          email: "kerry.ann.boyko@gmail.com",
          name: "Kerry Ann Boyko",
          phone: "+44 0 XXX XXX XXXX",
          text: `+44 0 XXX XXX XXXX`,
          notes: `Creator of Veritoot and OpenVeritoot`,
        },
      },
    },
  });
}

async function findAllAdmins() {
  return await prisma.administrator.findMany({
    include: {
      contact: true,
    },
  });
}

async function main() {
  console.log("running");
  await createTestAdmin();
  const allAdmins = await findAllAdmins();
  console.dir(allAdmins, { depth: null });
}

main()
  .then(async () => {
    await prisma.$disconnect();
    console.log("disconnected");
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    console.log("disconnected due to error");

    process.exit(1);
  });
