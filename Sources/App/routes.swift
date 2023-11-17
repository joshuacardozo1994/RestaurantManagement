import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: AuthenticationController())
    try app.register(collection: MenuController())
    try app.register(collection: OrderController())
    try app.register(collection: TableController())
    
    
    app.get { req async in
        HTTPStatus.ok
    }

    // Protected routes
    let protectedRoutes = app.grouped("protected").grouped(JWTAuthMiddleware(authorizedUserTypes: .validUsers))
    protectedRoutes.get("dashboard") { req async throws -> String in
        return "Protected Dashboard"
    }
    
    // Protected routes
    let adminRoutes = app.grouped("admin").grouped(JWTAuthMiddleware(authorizedUserTypes: [.admin]))
    adminRoutes.get("dashboard") { req async throws -> String in
        return "Protected admin Dashboard"
    }
}
