//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 30/10/23.
//

import Vapor
import Fluent

struct MenuHelper {
    static func addAllCategories(_ database: Database) async throws {
        
    let categories = [
        Category(name: "Beverages", position: 0, description: nil, type: .drinks),
        Category(name: "Hot beverages", position: 1, description: nil, type: .drinks),
        Category(name: "Mocktails", position: 2, description: nil, type: .drinks),
        Category(name: "Cocktails", position: 3, description: nil, type: .drinks),
        Category(name: "Vodka (60ml)", position: 4, description: nil, type: .drinks),
        Category(name: "Whiskey (60ml)", position: 5, description: nil, type: .drinks),
        Category(name: "Rum (60ml)", position: 6, description: nil, type: .drinks),
        Category(name: "Brandy (60ml)", position: 7, description: nil, type: .drinks),
        Category(name: "Wine", position: 8, description: nil, type: .drinks),
        Category(name: "Local Favourites (60ml)", position: 9, description: nil, type: .drinks),
        Category(name: "Gin (60ml)", position: 10, description: nil, type: .drinks),
        Category(name: "Others", position: 11, description: nil, type: .drinks),
        Category(name: "Soups", position: 12, description: nil, type: .food),
        Category(name: "Fish", position: 13, description: nil, type: .food),
        Category(name: "Shell Fish", position: 14, description: nil, type: .food),
        Category(name: "Veg", position: 15, description: nil, type: .food),
        Category(name: "Chicken", position: 16, description: nil, type: .food),
        Category(name: "Pork", position: 17, description: nil, type: .food),
        Category(name: "Beef", position: 18, description: nil, type: .food),
        Category(name: "Others", position: 19, description: nil, type: .food),
        Category(name: "Rice", position: 20, description: nil, type: .food),
        Category(name: "Desserts", position: 21, description: nil, type: .food),
    ]
        
    for category in categories {
        try await category.save(on: database)
        switch category.position {
        case 0:
            try await addBeverageItems(database, categoryId: category.requireID())
        case 1:
            try await addCoffeeTeaItems(database, categoryId: category.requireID())
        case 2:
            try await addAllMocktails(database, categoryId: category.requireID())
        case 3:
            try await addAllCocktails(database, categoryId: category.requireID())
        case 4:
            try await addAllVodkas(database, categoryId: category.requireID())
        case 5:
            try await addAllWhiskeys(database, categoryId: category.requireID())
        case 6:
            try await addAllRums(database, categoryId: category.requireID())
        case 7:
            try await addAllBrandies(database, categoryId: category.requireID())
        case 8:
            try await addAllWines(database, categoryId: category.requireID())
        case 9:
            try await addAllLocalDrinks(database, categoryId: category.requireID())
        case 10:
            try await addAllGins(database, categoryId: category.requireID())
        case 11:
            try await addAllBeers(database, categoryId: category.requireID())
        case 12:
            try await addAllSoups(database, categoryId: category.requireID())
        case 13:
            try await addAllFishItems(database, categoryId: category.requireID())
        case 14:
            try await addAllSeafoodItems(database, categoryId: category.requireID())
        case 15:
            try await addAllVegItems(database, categoryId: category.requireID())
        case 16:
            try await addAllChickenItems(database, categoryId: category.requireID())
        case 17:
            try await addAllPorkItems(database, categoryId: category.requireID())
        case 18:
            try await addAllBeefItems(database, categoryId: category.requireID())
        case 19:
            try await addMiscItems(database, categoryId: category.requireID())
        case 20:
            try await addRiceItems(database, categoryId: category.requireID())
        case 21:
            try await addDessertItems(database, categoryId: category.requireID())
        
        default:
            print("This should not happen")
        }
    }
}
    
    private static func addBeverageItems(_ database: Database, categoryId: UUID) async throws {
        let beverages = [
            Item(name: "Soda", suffix: nil, position: 0, description: nil, price: 20, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Soft Drinks", suffix: nil, position: 1, description: "Coca-cola, Limca, Sprite, Thums up, Maaza", price: 30, visibilityScope: .menu, categoryId: categoryId),
            Item(name: "Coca-cola", suffix: nil, position: 1, description: nil, price: 30, visibilityScope: .bill, categoryId: categoryId),
            Item(name: "Limca", suffix: nil, position: 1, description: nil, price: 30, visibilityScope: .bill, categoryId: categoryId),
            Item(name: "Sprite", suffix: nil, position: 1, description: nil, price: 30, visibilityScope: .bill, categoryId: categoryId),
            Item(name: "Thums up", suffix: nil, position: 1, description: nil, price: 30, visibilityScope: .bill, categoryId: categoryId),
            Item(name: "Maaza", suffix: nil, position: 1, description: nil, price: 30, visibilityScope: .bill, categoryId: categoryId),
            Item(name: "Tonic Water", suffix: nil, position: 2, description: nil, price: 90, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Fresh Lemon Soda", suffix: nil, position: 3, description: nil, price: 90, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Fresh Lemon Water", suffix: nil, position: 4, description: nil, price: 70, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Fresh Ginger Lemon Soda", suffix: nil, position: 5, description: nil, price: 120, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Orange/Mango Juice", suffix: "canned", position: 6, description: nil, price: 120, visibilityScope: .menu, categoryId: categoryId),
            Item(name: "Orange Juice", suffix: "canned", position: 6, description: nil, price: 120, visibilityScope: .bill, categoryId: categoryId),
            Item(name: "Mango Juice", suffix: "canned", position: 6, description: nil, price: 120, visibilityScope: .bill, categoryId: categoryId),
            Item(name: "Mineral Water", suffix: "1L", position: 7, description: nil, price: 30, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Mineral Water", suffix: "500 mL", position: 7, description: nil, price: 20, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Fresh Juice", suffix: nil, position: 8, description: nil, price: 160, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Diet Coke", suffix: nil, position: 9, description: nil, price: 60, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Ginger Ale", suffix: nil, position: 10, description: nil, price: 90, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `beverages` to your database or perform other actions can go here
        for beverage in beverages {
            try await beverage.save(on: database)
        }
    }
    
    private static func addCoffeeTeaItems(_ database: Database, categoryId: UUID) async throws {
        let coffeeTeaItems = [
            Item(name: "Milk Coffee", suffix: nil, position: 0, description: nil, price: 40, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Black Coffee", suffix: nil, position: 1, description: nil, price: 30, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Black Tea", suffix: nil, position: 2, description: nil, price: 20, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `coffeeTeaItems` to your database can go here.
        for item in coffeeTeaItems {
            try await item.save(on: database)
        }
    }
    
    private static func addAllMocktails(_ database: Database, categoryId: UUID) async throws {
        let menus = [
            Item(name: "Mock Whiskey", position: 0, description: "Apple juice, lime juice, ginger ale, lime juice, soda", price: 150, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Virgin Mojito", position: 1, description: "Mint, lime juice, sugar, soda, served over ice", price: 240, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Virgin Passion Fruit Mojito", position: 2, description: "Passion fruit, mint, lime juice, sugar, soda, served over ice", price: 260, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Virgin Watermelon Mojito", position: 3, description: "Watermelon, mint, lime juice, sugar, soda, served over ice", price: 260, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Iced Tea", position: 4, description: "Lemon", price: 150, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Shirley Temple", position: 5, description: "Lemon juice, strawberry syrup, soda, served on ice", price: 200, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Fruit Punch", position: 6, description: "Mixed fruits blended with milk and ice", price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Virgin Blue Lagoon", position: 7, description: "A vibrant blend of blue curaçao syrup, lemonade, and lemon juice, served over ice", price: 240, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        for menu in menus {
            try await menu.save(on: database)
        }
    }
    
    private static func addAllCocktails(_ database: Database, categoryId: UUID) async throws {
        
        let menus = [
            Item(name: "Mojito", position: 0, description: "White rum, mint, lime juice, sugar, soda, served over ice", price: 300, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Passion Fruit Mojito", position: 1, description: "White rum, passion fruit, mint, lime juice, soda, served over ice", price: 320, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Watermelon Mojito", position: 2, description: "White rum, watermelon, mint, lime juice, soda, served over ice", price: 320, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Gimlet", position: 3, description: "Gin, simple syrup, lemon juice, served chilled ", price: 350, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Tequila Sunrise", position: 4, description: "Tequila, lemon juice, orange juice, served chilled", price: 450, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Durigo Special", position: 5, description: "White rum, lemon juice, orange juice, strawberry syrup, served chilled", price: 400, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Purple Margarita", position: 6, description: "Butterfly pea tea, fresh lime juice, plus the right amount of tequila and triple sec", price: 450, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Screwdriver", position: 7, description: "A classic mix of smooth vodka and fresh orange juice, served over ice", price: 300, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Cosmopolitan", position: 8, description: "A chic blend of vodka, cranberry juice, lime, and a hint of triple sec", price: 450, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Blue Lagoon", position: 9, description: "An eye-catching cocktail featuring vodka, blue curaçao, and lemonade", price: 300, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        for menu in menus {
            try await menu.save(on: database)
        }
    }
    
    private static func addAllVodkas(_ database: Database, categoryId: UUID) async throws {
        
        let vodkaMenus = [
            Item(name: "Smirnoff", position: 0, description: nil, price: 100, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            
            Item(name: "Romanov", position: 1, description: nil, price: 50, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),

            Item(name: "Grey Goose", position: 2, description: nil, price: 390, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),

            Item(name: "Absolut", position: 3, description: nil, price: 400, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            
            Item(name: "Magic Moments", position: 4, description: "green apple, lemon ginger, chocolate", price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            
//            Item(name: "Magic Moments", prefix: "peg", suffix: "green apple", position: 4, description: nil, price: 90, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Magic Moments", prefix: "1/2 peg", suffix: "green apple", position: 4, description: nil, price: 45, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Magic Moments", prefix: "qt", suffix: "green apple", position: 4, description: nil, price: 270, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Magic Moments", prefix: "1/2 qt", suffix: "green apple", position: 4, description: nil, price: 135, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
            
//            Item(name: "Magic Moments", prefix: "peg", suffix: "lemon ginger", position: 4, description: nil, price: 90, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Magic Moments", prefix: "1/2 peg", suffix: "lemon ginger", position: 4, description: nil, price: 45, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Magic Moments", prefix: "qt", suffix: "lemon ginger", position: 4, description: nil, price: 270, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Magic Moments", prefix: "1/2 qt", suffix: "lemon ginger", position: 4, description: nil, price: 135, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
            
//            Item(name: "Magic Moments", prefix: "peg", suffix: "chocolate", position: 4, description: nil, price: 90, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Magic Moments", prefix: "1/2 peg", suffix: "chocolate", position: 4, description: nil, price: 45, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Magic Moments", prefix: "qt", suffix: "chocolate", position: 4, description: nil, price: 270, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Magic Moments", prefix: "1/2 qt", suffix: "chocolate", position: 4, description: nil, price: 135, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId)

        ]
        
        for menu in vodkaMenus {
            try await menu.save(on: database)
        }
        
        let servingSizes = try await ServingSize.query(on: database).all()
        
        for menu in vodkaMenus {
            for servingSize in servingSizes.filter({ $0.description.contains("ml") }) {
                try await ItemServingSizePivot(itemID: menu.requireID(), servingSizeID: servingSize.requireID()).save(on: database)
            }
        }
    }
    
    private static func addAllWhiskeys(_ database: Database, categoryId: UUID) async throws {
        
        let whiskeyMenus = [
            Item(name: "Black Dog", position: 0, description: nil, price: 190, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Black Dog", prefix: "1/2 peg", position: 0, description: nil, price: 95, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Black Dog", prefix: "qt", position: 0, description: nil, price: 570, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Black Dog", prefix: "1/2 qt", position: 0, description: nil, price: 285, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Black & White", position: 1, description: nil, price: 190, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Black & White", prefix: "1/2 peg", position: 1, description: nil, price: 95, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Black & White", prefix: "qt", position: 1, description: nil, price: 570, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Black & White", prefix: "1/2 qt", position: 1, description: nil, price: 285, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Teachers", position: 2, description: nil, price: 190, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Teachers", prefix: "1/2 peg", position: 2, description: nil, price: 95, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Teachers", prefix: "qt", position: 2, description: nil, price: 570, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Teachers", prefix: "1/2 qt", position: 2, description: nil, price: 285, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Vat 69", position: 3, description: nil, price: 140, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Vat 69", prefix: "1/2 peg", position: 3, description: nil, price: 70, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Vat 69", prefix: "qt", position: 3, description: nil, price: 420, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Vat 69", prefix: "1/2 qt", position: 3, description: nil, price: 210, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Blenders Pride", position: 4, description: nil, price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Blenders Pride", prefix: "1/2 peg", position: 4, description: nil, price: 45, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Blenders Pride", prefix: "qt", position: 4, description: nil, price: 270, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Blenders Pride", prefix: "1/2 qt", position: 4, description: nil, price: 135, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
            
            Item(name: "Blenders Pride", suffix: "Reserve", position: 5, description: nil, price: 120, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Blenders Pride", prefix: "1/2 peg", suffix: "Reserve", position: 5, description: nil, price: 60, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Blenders Pride", prefix: "qt", suffix: "Reserve", position: 5, description: nil, price: 360, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Blenders Pride", prefix: "1/2 qt", suffix: "Reserve", position: 5, description: nil, price: 180, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Peter Scot", position: 6, description: nil, price: 80, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Peter Scot", prefix: "1/2 peg", position: 6, description: nil, price: 40, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Peter Scot", prefix: "qt", position: 6, description: nil, price: 240, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Peter Scot", prefix: "1/2 qt", position: 6, description: nil, price: 120, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Signature", position: 7, description: nil, price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Signature", prefix: "1/2 peg", position: 7, description: nil, price: 45, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Signature", prefix: "qt", position: 7, description: nil, price: 270, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Signature", prefix: "1/2 qt", position: 7, description: nil, price: 135, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Royal Challenge", position: 8, description: nil, price: 60, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Royal Challenge", prefix: "1/2 peg", position: 8, description: nil, price: 30, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Royal Challenge", prefix: "qt", position: 8, description: nil, price: 180, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Royal Challenge", prefix: "1/2 qt", position: 8, description: nil, price: 90, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Royal Stag", position: 9, description: nil, price: 50, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Royal Stag", prefix: "1/2 peg", position: 9, description: nil, price: 25, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Royal Stag", prefix: "qt", position: 9, description: nil, price: 150, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Royal Stag", prefix: "1/2 qt", position: 9, description: nil, price: 75, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Mc Dowell's", position: 10, description: nil, price: 60, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Mc Dowell's", prefix: "1/2 peg", position: 10, description: nil, price: 30, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Mc Dowell's", prefix: "qt", position: 10, description: nil, price: 180, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Mc Dowell's", prefix: "1/2 qt", position: 10, description: nil, price: 90, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Jack Daniels", position: 11, description: nil, price: 350, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Jack Daniels", prefix: "1/2 peg", position: 11, description: nil, price: 175, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Jack Daniels", prefix: "qt", position: 11, description: nil, price: 1050, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Jack Daniels", prefix: "1/2 qt", position: 11, description: nil, price: 525, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "100 Pipers", position: 12, description: nil, price: 200, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "100 Pipers", prefix: "1/2 peg", position: 12, description: nil, price: 100, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "100 Pipers", prefix: "qt", position: 12, description: nil, price: 600, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "100 Pipers", prefix: "qt", position: 12, description: nil, price: 300, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
            
            Item(name: "Antiquity", position: 13, description: nil, price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Antiquity", prefix: "1/2 peg", position: 13, description: nil, price: 45, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Antiquity", prefix: "qt", position: 13, description: nil, price: 270, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Antiquity", prefix: "1/2 qt", position: 13, description: nil, price: 135, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

        ]
        
        // Additional code to save `whiskeyMenus` to your database or perform other actions can go here
        for menu in whiskeyMenus {
            try await menu.save(on: database)
        }
        
        let servingSizes = try await ServingSize.query(on: database).all()
        
        for menu in whiskeyMenus {
            for servingSize in servingSizes.filter({ $0.description.contains("ml") }) {
                try await ItemServingSizePivot(itemID: menu.requireID(), servingSizeID: servingSize.requireID()).save(on: database)
            }
        }
    }
    
    private static func addAllRums(_ database: Database, categoryId: UUID) async throws {
        
        let rumMenus = [
            Item(name: "Old Monk", suffix: nil, position: 0, description: nil, price: 50, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Old Monk", prefix: "1/2 peg", suffix: nil, position: 0, description: nil, price: 25, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Old Monk", prefix: "qt", suffix: nil, position: 0, description: nil, price: 150, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Old Monk", prefix: "1/2 qt", suffix: nil, position: 0, description: nil, price: 75, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
            
            // Bacardi White
            Item(name: "Bacardi", suffix: "White", position: 1, description: nil, price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Bacardi", prefix: "1/2 peg", suffix: "White", position: 1, description: nil, price: 45, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Bacardi", prefix: "qt", suffix: "White", position: 1, description: nil, price: 270, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Bacardi", prefix: "1/2 qt", suffix: "White", position: 1, description: nil, price: 135, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            // Bacardi Limon
            Item(name: "Bacardi", suffix: "Limon", position: 2, description: nil, price: 100, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Bacardi", prefix: "1/2 peg", suffix: "Limon", position: 2, description: nil, price: 50, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Bacardi", prefix: "qt", suffix: "Limon", position: 2, description: nil, price: 300, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Bacardi", prefix: "1/2 qt", suffix: "Limon", position: 2, description: nil, price: 150, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            // Bacardi Black
            Item(name: "Bacardi", suffix: "Black", position: 3, description: nil, price: 80, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Bacardi", prefix: "1/2 peg", suffix: "Black", position: 3, description: nil, price: 40, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Bacardi", prefix: "qt", suffix: "Black", position: 3, description: nil, price: 240, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Bacardi", prefix: "1/2 qt", suffix: "Black", position: 3, description: nil, price: 120, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            // Makazai White
            Item(name: "Makazai", suffix: "White", position: 4, description: nil, price: 140, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Makazai", prefix: "1/2 peg", suffix: "White", position: 4, description: nil, price: 70, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Makazai", prefix: "qt", suffix: "White", position: 4, description: nil, price: 420, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Makazai", prefix: "1/2 qt", suffix: "White", position: 4, description: nil, price: 210, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            // Makazai Gold
            Item(name: "Makazai", suffix: "Gold", position: 5, description: nil, price: 160, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Makazai", prefix: "1/2 peg", suffix: "Gold", position: 5, description: nil, price: 80, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Makazai", prefix: "qt", suffix: "Gold", position: 5, description: nil, price: 480, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Makazai", prefix: "1/2 qt", suffix: "Gold", position: 5, description: nil, price: 240, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Mc Dowell's", suffix: "White", position: 6, description: nil, price: 50, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Mc Dowell's", prefix: "1/2 peg", suffix: "White", position: 6, description: nil, price: 25, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Mc Dowell's", prefix: "qt", suffix: "White", position: 6, description: nil, price: 150, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Mc Dowell's", prefix: "1/2 qt", suffix: "White", position: 6, description: nil, price: 75, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

        ]
        
        // Additional code to save `rumMenus` to your database or perform other actions can go here
        for menu in rumMenus {
            try await menu.save(on: database)
        }
        
        let servingSizes = try await ServingSize.query(on: database).all()
        
        for menu in rumMenus {
            for servingSize in servingSizes.filter({ $0.description.contains("ml") }) {
                try await ItemServingSizePivot(itemID: menu.requireID(), servingSizeID: servingSize.requireID()).save(on: database)
            }
        }
        
    }
    
    private static func addAllBrandies(_ database: Database, categoryId: UUID) async throws {
        
        let brandyMenus = [
            Item(name: "Honey Bee", suffix: nil, position: 0, description: nil, price: 40, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Honey Bee", prefix: "1/2 peg", suffix: nil, position: 0, description: nil, price: 20, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Honey Bee", prefix: "qt", suffix: nil, position: 0, description: nil, price: 120, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Honey Bee", prefix: "1/2 qt", suffix: nil, position: 0, description: nil, price: 60, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Mansion House", suffix: nil, position: 1, description: nil, price: 50, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Mansion House", prefix: "1/2 peg", suffix: nil, position: 1, description: nil, price: 25, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Mansion House", prefix: "qt", suffix: nil, position: 1, description: nil, price: 150, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Mansion House", prefix: "1/2 qt", suffix: nil, position: 1, description: nil, price: 75, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Morpheus", suffix: nil, position: 2, description: nil, price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Morpheus", prefix: "1/2 peg", suffix: nil, position: 2, description: nil, price: 45, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Morpheus", prefix: "qt", suffix: nil, position: 2, description: nil, price: 270, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Morpheus", prefix: "1/2 qt", suffix: nil, position: 2, description: nil, price: 135, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

        ]
        
        // Additional code to save `brandyMenus` to your database or perform other actions can go here
        for menu in brandyMenus {
            try await menu.save(on: database)
        }
        
        let servingSizes = try await ServingSize.query(on: database).all()
        
        for menu in brandyMenus {
            for servingSize in servingSizes.filter({ $0.description.contains("ml") }) {
                try await ItemServingSizePivot(itemID: menu.requireID(), servingSizeID: servingSize.requireID()).save(on: database)
            }
        }
    }
    
    private static func addAllWines(_ database: Database, categoryId: UUID) async throws {
        
        let wineMenus = [
            Item(name: "Madeira", suffix: "Red/White", position: 0, description: nil, price: 220, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Port Wine", suffix: nil, position: 1, description: nil, price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `wineMenus` to your database or perform other actions can go here
        for menu in wineMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addAllLocalDrinks(_ database: Database, categoryId: UUID) async throws {
        
        let localDrinkMenus = [
            Item(name: "Urak", suffix: nil, position: 0, description: nil, price: 50, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Urak", prefix: "1/2 peg", suffix: nil, position: 0, description: nil, price: 25, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Urak", prefix: "qt", suffix: nil, position: 0, description: nil, price: 150, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Urak", prefix: "1/2 qt", suffix: nil, position: 0, description: nil, price: 75, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
            
            Item(name: "Cashew/Kaju Feni", suffix: nil, position: 1, description: nil, price: 70, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Cashew/Kaju Feni", prefix: "1/2 peg", suffix: nil, position: 1, description: nil, price: 35, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Cashew/Kaju Feni", prefix: "qt", suffix: nil, position: 1, description: nil, price: 210, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Cashew/Kaju Feni", prefix: "1/2 qt", suffix: nil, position: 1, description: nil, price: 105, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
            
            Item(name: "Ginger Feni", suffix: nil, position: 2, description: nil, price: 80, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Ginger Feni", prefix: "1/2 peg", suffix: nil, position: 2, description: nil, price: 40, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Ginger Feni", prefix: "qt", suffix: nil, position: 2, description: nil, price: 240, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Ginger Feni", prefix: "1/2 qt", suffix: nil, position: 2, description: nil, price: 120, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
            
            Item(name: "Dudshiri", suffix: nil, position: 3, description: nil, price: 80, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Dudshiri", prefix: "1/2 peg", suffix: nil, position: 3, description: nil, price: 40, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Dudshiri", prefix: "qt", suffix: nil, position: 3, description: nil, price: 240, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Dudshiri", prefix: "1/2 qt", suffix: nil, position: 3, description: nil, price: 120, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
        ]
        
        // Additional code to save `localDrinkMenus` to your database or perform other actions can go here
        for menu in localDrinkMenus {
            try await menu.save(on: database)
        }
        
        let servingSizes = try await ServingSize.query(on: database).all()
        
        for menu in localDrinkMenus {
            for servingSize in servingSizes.filter({ $0.description.contains("ml") }) {
                try await ItemServingSizePivot(itemID: menu.requireID(), servingSizeID: servingSize.requireID()).save(on: database)
            }
        }
    }
    
    private static func addAllGins(_ database: Database, categoryId: UUID) async throws {
        
        let ginMenus = [
            Item(name: "Blue Ribbon", suffix: nil, position: 0, description: nil, price: 50, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Blue Ribbon", prefix: "1/2 peg", suffix: nil, position: 0, description: nil, price: 25, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Blue Ribbon", prefix: "qt", suffix: nil, position: 0, description: nil, price: 150, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Blue Ribbon", prefix: "1/2 qt", suffix: nil, position: 0, description: nil, price: 75, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Greater than", suffix: "London Dry", position: 1, description: nil, price: 120, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Greater than", prefix: "1/2 peg", suffix: "London Dry", position: 1, description: nil, price: 60, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Greater than", prefix: "qt", suffix: "London Dry", position: 1, description: nil, price: 360, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Greater than", prefix: "1/2 qt", suffix: "London Dry", position: 1, description: nil, price: 180, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Seqer", suffix: nil, position: 2, description: nil, price: 170, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Seqer", prefix: "1/2 peg", suffix: nil, position: 2, description: nil, price: 85, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Seqer", prefix: "qt", suffix: nil, position: 2, description: nil, price: 510, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Seqer", prefix: "1/2 qt", suffix: nil, position: 2, description: nil, price: 255, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),

            Item(name: "Sativa", suffix: nil, position: 3, description: nil, price: 190, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
//            Item(name: "Sativa", prefix: "1/2 peg", suffix: nil, position: 3, description: nil, price: 95, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Sativa", prefix: "qt", suffix: nil, position: 3, description: nil, price: 570, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
//            Item(name: "Sativa", prefix: "1/2 qt", suffix: nil, position: 3, description: nil, price: 285, imageUrl: nil, visibilityScope: .bill, categoryId: categoryId),
        ]
        
        // Additional code to save `ginMenus` to your database or perform other actions can go here
        for menu in ginMenus {
            try await menu.save(on: database)
        }
        
        let servingSizes = try await ServingSize.query(on: database).all()
        
        for menu in ginMenus {
            for servingSize in servingSizes.filter({ $0.description.contains("ml") }) {
                try await ItemServingSizePivot(itemID: menu.requireID(), servingSizeID: servingSize.requireID()).save(on: database)
            }
        }
    }
    
    private static func addAllBeers(_ database: Database, categoryId: UUID) async throws {
        
        let beerMenus = [
            Item(name: "Kingfisher", suffix: "Q", position: 0, description: nil, price: 140, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Kingfisher", suffix: "P", position: 1, description: nil, price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Tuborg", suffix: nil, position: 2, description: nil, price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Budweiser", suffix: "Q", position: 3, description: nil, price: 160, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Budweiser", suffix: "P", position: 4, description: nil, price: 160, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Breezer", suffix: nil, position: 5, description: nil, price: 160, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Corona", suffix: nil, position: 6, description: nil, price: 170, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Hoegaarden", suffix: nil, position: 7, description: nil, price: 170, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "People's Lager", suffix: nil, position: 8, description: nil, price: 120, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `beerMenus` to your database or perform other actions can go here
        for menu in beerMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addAllSoups(_ database: Database, categoryId: UUID) async throws {
        
        let soupMenus = [
            Item(name: "Veg. Soup", suffix: nil, position: 0, description: nil, price: 160, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Beef Soup", suffix: nil, position: 1, description: nil, price: 180, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chicken Soup", suffix: nil, position: 2, description: nil, price: 180, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Mushroom Soup", suffix: nil, position: 3, description: "surchage of rupees 20 applicable on 1 by 2 soups", price: 180, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `soupMenus` to your database or perform other actions can go here
        for menu in soupMenus {
            try await menu.save(on: database)
        }
        
        let servingSizes = try await ServingSize.query(on: database).all()
        
        for menu in soupMenus {
            for servingSize in servingSizes.filter({ !$0.description.contains("ml") }) {
                try await ItemServingSizePivot(itemID: menu.requireID(), servingSizeID: servingSize.requireID()).save(on: database)
            }
        }
    }
    
    private static func addAllFishItems(_ database: Database, categoryId: UUID) async throws {
        
        let fishMenus = [
            Item(name: "Chonok Rawa Fry", suffix: nil, position: 0, description: nil, price: 500, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chonok (Plain/Masala)", suffix: nil, position: 1, description: nil, price: 600, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Shark", suffix: nil, position: 2, description: nil, price: 450, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Calamari/Squid", suffix: nil, position: 3, description: nil, price: 350, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "King Fish", suffix: nil, position: 4, description: nil, price: 0, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pomfret", suffix: "Silver", position: 5, description: nil, price: 0, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Mackerel", suffix: nil, position: 6, description: nil, price: 200, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Sole Fish", suffix: nil, position: 7, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Bombill", suffix: "Bombay Duck", position: 8, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Stuffed Calamari/Squid", suffix: nil, position: 9, description: "Squid stuffed with recheado masala and squid tentacles", price: 400, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Local Fish", suffix: nil, position: 10, description: nil, price: 0, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `fishMenus` to your database or perform other actions can go here
        for menu in fishMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addAllSeafoodItems(_ database: Database, categoryId: UUID) async throws {
        
        let seafoodMenus = [
            Item(name: "Prawns", suffix: nil, position: 0, description: nil, price: 390, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Oysters", suffix: nil, position: 1, description: nil, price: 350, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Mussels", suffix: nil, position: 2, description: nil, price: 350, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Crabs", suffix: nil, position: 3, description: nil, price: 0, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `seafoodMenus` to your database or perform other actions can go here
        for menu in seafoodMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addAllVegItems(_ database: Database, categoryId: UUID) async throws {
        
        let vegMenus = [
            Item(name: "Mushroom Chilli Fry", suffix: nil, position: 0, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Mushroom Xacuti", suffix: nil, position: 1, description: nil, price: 280, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Mix Veg. Xacuti", suffix: nil, position: 2, description: nil, price: 280, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Gobi Manchurian", suffix: nil, position: 3, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Mixed Salad", suffix: nil, position: 4, description: nil, price: 150, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "French Fries", suffix: nil, position: 5, description: nil, price: 150, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Corn Jalapeño cheese pops", suffix: nil, position: 6, description: nil, price: 150, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Paneer Chilli", suffix: nil, position: 7, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `vegMenus` to your database or perform other actions can go here
        for menu in vegMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addAllChickenItems(_ database: Database, categoryId: UUID) async throws {
        
        let chickenMenus = [
            Item(name: "Chicken Lollipop", suffix: nil, position: 0, description: nil, price: 180, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chilli Chicken", suffix: "dry/gravy", position: 1, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chicken Manchurian", suffix: "dry/gravy", position: 2, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Crispy Chicken", suffix: nil, position: 3, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chicken Cutlets", suffix: nil, position: 4, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chicken Dry Fry", suffix: "pieces/leg", position: 5, description: nil, price: 280, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chicken Chilli Fry", suffix: nil, position: 6, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chicken Cafreal", suffix: "dry/gravy", position: 7, description: nil, price: 290, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chicken Xacuti", suffix: nil, position: 8, description: nil, price: 290, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `chickenMenus` to your database or perform other actions can go here
        for menu in chickenMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addAllPorkItems(_ database: Database, categoryId: UUID) async throws {
        
        let porkMenus = [
            Item(name: "Sausages", suffix: nil, position: 0, description: nil, price: 150, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Sausage Chilli Fry", suffix: nil, position: 1, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Sausage Bread", suffix: nil, position: 2, description: nil, price: 90, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pork Chilli Fry", suffix: nil, position: 3, description: nil, price: 280, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pork Roast", suffix: nil, position: 4, description: nil, price: 300, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pork Amsol", suffix: nil, position: 5, description: nil, price: 350, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pork Bones", suffix: "aadmas", position: 6, description: nil, price: 280, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pork Chops", suffix: nil, position: 7, description: nil, price: 400, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Sorpotel", suffix: nil, position: 8, description: nil, price: 300, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pork Vindalo", suffix: nil, position: 9, description: nil, price: 350, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `porkMenus` to your database or perform other actions can go here
        for menu in porkMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addAllBeefItems(_ database: Database, categoryId: UUID) async throws {
        
        let beefMenus = [
            Item(name: "Beef Chilli Fry", suffix: nil, position: 0, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Beef Cutlets", suffix: nil, position: 1, description: nil, price: 250, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Beef Dry Fry", suffix: nil, position: 2, description: nil, price: 300, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Beef Tongue Roast", suffix: nil, position: 3, description: nil, price: 300, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Beef Roulade", suffix: nil, position: 4, description: nil, price: 350, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Beef Cafreal", suffix: nil, position: 5, description: nil, price: 300, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Beef Xacuti", suffix: nil, position: 6, description: nil, price: 300, imageUrl: nil, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `beefMenus` to your database or perform other actions can go here
        for menu in beefMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addMiscItems(_ database: Database, categoryId: UUID) async throws {
        
        let miscMenus = [
            Item(name: "Para", suffix: nil, position: 0, description: "Salted fish aged in a vinegar based spiced masala", price: 150, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Dry Fish Salad", suffix: nil, position: 1, description: nil, price: 180, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Sanna", suffix: "per piece", position: 2, description: nil, price: 40, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Bread", suffix: nil, position: 3, description: nil, price: 10, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Paratha", suffix: nil, position: 4, description: nil, price: 30, imageUrl: nil, visibilityScope: .both, categoryId: categoryId),
        ]
        
        // Additional code to save `miscMenus` to your database or perform other actions can go here
        for menu in miscMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addRiceItems(_ database: Database, categoryId: UUID) async throws {
        
        let riceMenus = [
            Item(name: "Plain Rice", suffix: nil, position: 0, description: nil, price: 60, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Basmati Rice", suffix: nil, position: 1, description: nil, price: 80, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Prawn Curry Rice", suffix: nil, position: 2, description: nil, price: 290, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Shark Ambot-tik Rice", suffix: nil, position: 3, description: nil, price: 290, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Plain Pulao", suffix: nil, position: 4, description: nil, price: 160, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Veg. Pulao", suffix: nil, position: 5, description: nil, price: 180, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chicken Pulao", suffix: nil, position: 6, description: nil, price: 200, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Beef Pulao", suffix: nil, position: 7, description: nil, price: 200, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pork Sausage Pulao", suffix: nil, position: 8, description: nil, price: 200, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Prawns Pulao", suffix: nil, position: 9, description: nil, price: 250, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Veg. Fried Rice", suffix: nil, position: 10, description: nil, price: 180, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Egg Fried Rice", suffix: nil, position: 11, description: nil, price: 180, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chicken Fried Rice", suffix: nil, position: 12, description: nil, price: 200, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Beef Fried Rice", suffix: nil, position: 13, description: nil, price: 200, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pork Sausage Fried Rice", suffix: nil, position: 14, description: nil, price: 200, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Prawns Fried Rice", suffix: nil, position: 15, description: nil, price: 250, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Mixed Fried Rice", suffix: nil, position: 16, description: nil, price: 250, visibilityScope: .both, categoryId: categoryId)
            
        ]
        
        // Additional code to save `riceMenus` to your database or perform other actions can go here
        for menu in riceMenus {
            try await menu.save(on: database)
        }
    }
    
    private static func addDessertItems(_ database: Database, categoryId: UUID) async throws {
        
        let desserts = [
            Item(name: "Ice Cream", suffix: "Single scoop", position: 0, description: "Vanilla, chocolate, mango", price: 70, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Ice Cream", suffix: "Double scoop", position: 1, description: "Vanilla, chocolate, mango", price: 120, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Caramel Pudding", suffix: nil, position: 2, description: "Custard made with eggs, sugar, and milk, with a caramelized sugar bottom", price: 100, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chocolate Brownie", suffix: nil, position: 3, description: "Chocolate brownie with cashew nuts and walnuts", price: 100, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Pancakes", suffix: nil, position: 4, description: "Chocolate, Banana, Honey, Lemon, Coconut Jaggery", price: 100, visibilityScope: .both, categoryId: categoryId),
            Item(name: "Chocolate Brownie", suffix: "With ice-cream", position: 5, description: nil, price: 160, visibilityScope: .both, categoryId: categoryId)
        ]
        
        // Additional code to save `desserts` to your database or perform other actions can go here
        for dessert in desserts {
            try await dessert.save(on: database)
        }
    }
    
    static func addServingSizes(_ database: Database) async throws {
        let servingSizes = [
            ServingSize(name: "peg", description: "60 ml", expression: "x"),
            ServingSize(name: "1/2 peg", description: "30 ml", expression: "x/2"),
            ServingSize(name: "1 qt", description: "180 ml", expression: "3*x"),
            ServingSize(name: "1/2 qt", description: "90 ml", expression: "3*x/2"),
            ServingSize(name: "1/2", description: "1/2 for soups", expression: "x/2 + 10")
        ]
        
        for servingSize in servingSizes {
            try await servingSize.save(on: database)
        }
    }
}


