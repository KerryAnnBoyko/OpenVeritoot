import prisma from "../";

import type { Contact } from "@/types/database";

export const createContact = (contact: Contact): Promise<unknown> =>
  prisma.contact.create({ data: contact });
