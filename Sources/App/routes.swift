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
    
    app.get("setmenu") { req async throws -> String in
//        try await addAllCategories(req)
//        
//        try await addBeverageItems(req)
//
//        try await addCoffeeTeaItems(req)
//
//        try await addAllMocktails(req)
//
//        try await addAllCocktails(req)
//
//        try await addAllVodkas(req)
//
//        try await addAllWhiskeys(req)
//
//        try await addAllRums(req)
//
//        try await addAllBrandies(req)
//
//        try await addAllWines(req)
//
//        try await addAllLocalDrinks(req)
//
//        try await addAllGins(req)
//
//        try await addAllBeers(req)
//
//        try await addAllSoups(req)
//
//        try await addAllFishItems(req)
//
//        try await addAllSeafoodItems(req)
//
//        try await addAllVegItems(req)
//
//        try await addAllChickenItems(req)
//
//        try await addAllPorkItems(req)
//
//        try await addAllBeefItems(req)
//
//        try await addMiscItems(req)
//
//        try await addRiceItems(req)
//
//        try await addDessertItems(req)
        return "ok"
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
