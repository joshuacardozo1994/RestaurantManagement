import Fluent
import Vapor

func routes(_ app: Application) throws {
    try app.register(collection: AuthenticationController())
    try app.register(collection: MenuController())
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    // Protected routes
        let protectedRoutes = app.grouped("protected").grouped(JWTAuthMiddleware())
        protectedRoutes.get("dashboard") { req async throws -> String in
            // Your protected logic here
            return "Protected Dashboard"
        }

        // Another protected route
        protectedRoutes.get("profile") { req async throws -> String in
            // Your protected logic here
            return "Protected Profile"
        }
    
    
    
    

}
