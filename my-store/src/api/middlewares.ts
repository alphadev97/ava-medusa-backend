import { defineMiddlewares } from "@medusajs/medusa"
import type {
  MedusaRequest,
  MedusaResponse,
  MedusaNextFunction,
} from "@medusajs/framework/http"

export default defineMiddlewares({
  routes: [
    {
      matcher: "/",
      method: "GET",
      middlewares: [
        (req: MedusaRequest, res: MedusaResponse, next: MedusaNextFunction) => {
          // Only handle exact root path
          if (req.path === "/" && req.method === "GET") {
            return res.status(200).json({
              status: "ok",
              message: "Medusa backend running successfully"
            })
          }
          next()
        },
      ],
    },
  ],
})

