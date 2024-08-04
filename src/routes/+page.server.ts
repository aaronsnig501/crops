import type { PageServerLoad } from "./$types"
import { prisma } from "$lib/server/prisma"

export const load: PageServerLoad = async () => {
  return {
    categories: await prisma.category.findMany({
      include: { crops: { include: { types: true } } }
    }),
  }
}