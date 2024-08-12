import { redirect } from "@sveltejs/kit"
import type { Actions } from "./$types"

export const actions: Actions = {
  createNewEntry: async ({ request }) => {
    const { 
      level, 
      idOfPreviousLevel, 
      name, 
      cook, 
      store, 
      preserve, 
      grow, 
      description 
    } = Object.fromEntries(await request.formData()) as {
      level: string
      idOfPreviousLevel: number
      name: string
      cook: string
      store: string
      preserve: string
      grow: string
      description: string
    }

    let data = { 
      name, 
      description, 
      grow, 
      store, 
      cook, 
      preserve,
    }

    if (!idOfPreviousLevel) {
      try {
        await prisma.category.create({ data })
      } catch (error) {
        console.log(error)
      }
      
    } else if (level === "crop") {
      data["categoryId"] = Number(idOfPreviousLevel)

      try {
        await prisma.crop.create({ data })
      } catch (error) {
        console.log(error)
      }
      
    } else if (level === "type") {
      data["cropId"] = Number(idOfPreviousLevel)
      try {
      await prisma.type.create({ data })
      } catch (error) {
        console.log(error)
      }
    }

    return redirect(302, "/")
  }
}