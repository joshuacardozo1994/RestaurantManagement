//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 30/10/23.
//

import Vapor


func addAllCategories(_ req: Request) async throws {
    let categories = [
        Category(name: "Beverages", position: 0, description: nil, type: .drinks),
        Category(name: "Hot beverages", position: 1, description: nil, type: .drinks),
        Category(name: "Mocktails", position: 2, description: nil, type: .drinks),
        Category(name: "Cocktails", position: 3, description: nil, type: .drinks),
        Category(name: "Vodka (60ml)", position: 4, description: nil, type: .drinks),
        Category(name: "Whiskey", position: 5, description: nil, type: .drinks),
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
        try await category.save(on: req.db)
    }
}

func addBeverageItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "1e9ee0a0-ffb2-42b4-9912-888ab398cc81")!
    
    let beverages = [
        Item(name: "Soda", subtext: nil, position: 0, description: nil, price: 20, enabled: true, categoryId: categoryId),
        Item(name: "Soft Drinks", subtext: "Coca-cola, Limca, Sprite, Thums up", position: 1, description: nil, price: 30, enabled: true, categoryId: categoryId),
        Item(name: "Coca-cola", subtext: nil, position: 1, description: nil, price: 30, enabled: false, categoryId: categoryId),
        Item(name: "Limca", subtext: nil, position: 1, description: nil, price: 30, enabled: false, categoryId: categoryId),
        Item(name: "Sprite", subtext: nil, position: 1, description: nil, price: 30, enabled: false, categoryId: categoryId),
        Item(name: "Thums up", subtext: nil, position: 1, description: nil, price: 30, enabled: false, categoryId: categoryId),
        Item(name: "Tonic Water", subtext: nil, position: 2, description: nil, price: 90, enabled: true, categoryId: categoryId),
        Item(name: "Fresh Lemon Soda", subtext: nil, position: 3, description: nil, price: 90, enabled: true, categoryId: categoryId),
        Item(name: "Fresh Lemon Water", subtext: nil, position: 4, description: nil, price: 70, enabled: true, categoryId: categoryId),
        Item(name: "Fresh Ginger Lemon Soda", subtext: nil, position: 5, description: nil, price: 120, enabled: true, categoryId: categoryId),
        Item(name: "Orange/Mango Juice", subtext: "canned", position: 6, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Item(name: "Orange Juice", subtext: "canned", position: 6, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Item(name: "Mango Juice", subtext: "canned", position: 6, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Item(name: "Mineral Water", subtext: nil, position: 7, description: nil, price: 30, enabled: true, categoryId: categoryId)
    ]

    // Additional code to save `beverages` to your database or perform other actions can go here
    for beverage in beverages {
        try await beverage.save(on: req.db)
    }
}

func addCoffeeTeaItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "b6e19523-78ad-4f83-8b2b-cd7a80458957")!

    let coffeeTeaItems = [
        Item(name: "Milk Coffee", subtext: nil, position: 0, description: nil, price: 40, enabled: true, categoryId: categoryId),
        Item(name: "Black Coffee", subtext: nil, position: 1, description: nil, price: 30, enabled: true, categoryId: categoryId),
        Item(name: "Black Tea", subtext: nil, position: 2, description: nil, price: 20, enabled: true, categoryId: categoryId)
    ]

    // Additional code to save `coffeeTeaItems` to your database can go here.
    for item in coffeeTeaItems {
        try await item.save(on: req.db)
    }
}

func addAllMocktails(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "0e55be19-d4e7-4ab8-af1b-dae375b07336")!
    let menus = [
        Item(name: "Mock Whiskey", position: 0, description: "Apple juice, lime juice, ginger ale, lime juice, soda", price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Virgin Mojito", position: 1, description: "Mint, lime juice, sugar, soda, served over ice", price: 220, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Virgin Passion Fruit Mojito", position: 2, description: "Passion fruit, mint, lime juice, sugar, soda, served over ice", price: 240, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Virgin Watermelon Mojito", position: 3, description: "Watermelon, mint, lime juice, sugar, soda, served over ice", price: 240, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Iced Tea", position: 4, description: "Lemon", price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Shirley Temple", position: 5, description: "Lemon juice, strawberry syrup, soda, served on ice", price: 200, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Fruit Punch", position: 6, description: "Mixed fruits blended with milk and ice", price: 200, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    for menu in menus {
        try await menu.save(on: req.db)
    }
}

func addAllCocktails(_ req: Request) async throws {
    let newCategoryId = UUID(uuidString: "d956e342-c68f-4cf6-9cc6-c78bfc66174c")!

    let menus = [
        Item(name: "Mojito", position: 0, description: "White rum, mint, lime juice, sugar, soda, served over ice", price: 280, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Item(name: "Passion Fruit Mojito", position: 1, description: "White rum, passion fruit, mint, lime juice, soda, served over ice", price: 300, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Item(name: "Watermelon Mojito", position: 2, description: "White rum, watermelon, mint, lime juice, soda, served over ice", price: 300, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Item(name: "Gimlet", position: 3, description: "Gin, simple syrup, lemon juice, served chilled ", price: 300, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Item(name: "Tequila Sunrise", position: 4, description: "Tequila, lemon juice, orange juice, served chilled", price: 350, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Item(name: "Durigo Special", position: 5, description: "White rum, lemon juice, orange juice, strawberry syrup, served chilled", price: 350, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Item(name: "Purple Margarita", position: 6, description: "Butterfly pea tea, fresh lime juice, plus the right amount of tequila and triple sec", price: 400, imageUrl: nil, enabled: true, categoryId: newCategoryId)
    ]
    
    for menu in menus {
        try await menu.save(on: req.db)
    }
}

func addAllVodkas(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "f33d6f38-f91a-4741-a283-fc4f4befebdc")!
    
    let vodkaMenus = [
        Item(name: "Smirnoff", position: 0, description: nil, price: 100, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Romanov", position: 1, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Grey Goose", position: 2, description: nil, price: 390, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Absolut", position: 3, description: nil, price: 380, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    for menu in vodkaMenus {
        try await menu.save(on: req.db)
    }
}

func addAllWhiskeys(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "2c4d9cd7-30b5-4933-8c95-5b9741ecb091")!
    
    let whiskeyMenus = [
        Item(name: "Black Dog", position: 0, description: nil, price: 190, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Black & White", position: 1, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Teachers", position: 2, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Vat 69", position: 3, description: nil, price: 140, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Blenders Pride", position: 4, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Peter Scot", position: 5, description: nil, price: 80, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Signature", position: 6, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Royal Challenge", position: 7, description: nil, price: 60, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Royal Stag", position: 8, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Mc Dowell's", position: 9, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Jack Daniels", position: 10, description: nil, price: 320, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "100 Pipers", position: 11, description: nil, price: 200, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `whiskeyMenus` to your database or perform other actions can go here
    for menu in whiskeyMenus {
        try await menu.save(on: req.db)
    }
}

func addAllRums(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "33e4f9e1-87db-4820-be2d-6ee52d15e4db")!
    
    let rumMenus = [
        Item(name: "Old Monk", subtext: nil, position: 0, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Bacardi", subtext: "White", position: 1, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Bacardi", subtext: "Limon", position: 2, description: nil, price: 100, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Bacardi", subtext: "Black", position: 3, description: nil, price: 80, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Makazai", subtext: "White", position: 4, description: nil, price: 140, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Makazai", subtext: "Gold", position: 5, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `rumMenus` to your database or perform other actions can go here
    for menu in rumMenus {
        try await menu.save(on: req.db)
    }
}

func addAllBrandies(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "c1677ed9-b6ba-4aed-9288-13ef5ae37972")!
    
    let brandyMenus = [
        Item(name: "Honey Bee", subtext: nil, position: 0, description: nil, price: 40, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Mansion House", subtext: nil, position: 1, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `brandyMenus` to your database or perform other actions can go here
    for menu in brandyMenus {
        try await menu.save(on: req.db)
    }
}

func addAllWines(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "bc14a66c-3824-4e18-b779-ce5589d3e77d")!
    
    let wineMenus = [
        Item(name: "Madeira", subtext: "Red/White", position: 0, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Port Wine", subtext: nil, position: 1, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `wineMenus` to your database or perform other actions can go here
    for menu in wineMenus {
        try await menu.save(on: req.db)
    }
}

func addAllLocalDrinks(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "e30a0b6a-ce84-48a7-a78c-1336dfbf9484")!
    
    let localDrinkMenus = [
        Item(name: "Urak", subtext: nil, position: 0, description: nil, price: 40, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Cashew/Kaju Feni", subtext: nil, position: 1, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Ginger Feni", subtext: nil, position: 2, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Dudshiri", subtext: nil, position: 3, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `localDrinkMenus` to your database or perform other actions can go here
    for menu in localDrinkMenus {
        try await menu.save(on: req.db)
    }
}

func addAllGins(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "0e86fd6c-6c32-451d-800e-e54ea14475dc")!
    
    let ginMenus = [
        Item(name: "Blue Ribbon", subtext: nil, position: 0, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Greater than (London Dry)", subtext: nil, position: 1, description: nil, price: 120, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Seqer", subtext: nil, position: 2, description: nil, price: 170, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Sativa", subtext: nil, position: 3, description: nil, price: 190, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `ginMenus` to your database or perform other actions can go here
    for menu in ginMenus {
        try await menu.save(on: req.db)
    }
}

func addAllBeers(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "e3b62ed4-f8a9-4363-a634-53f3916eff60")!
    
    let beerMenus = [
        Item(name: "Kingfisher", subtext: "Q", position: 0, description: nil, price: 140, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Kingfisher", subtext: "P", position: 1, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Tuborg", subtext: nil, position: 2, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Budweiser", subtext: "C", position: 3, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Breezer", subtext: nil, position: 4, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Corona", subtext: nil, position: 5, description: nil, price: 170, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Hoegaarden", subtext: nil, position: 6, description: nil, price: 170, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Kings", subtext: nil, position: 7, description: nil, price: 100, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "People's Lager", subtext: nil, position: 8, description: nil, price: 120, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `beerMenus` to your database or perform other actions can go here
    for menu in beerMenus {
        try await menu.save(on: req.db)
    }
}

func addAllSoups(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "6f7c3705-b7a9-4cb8-8824-195e16892a45")!
    
    let soupMenus = [
        Item(name: "Veg. Soup", subtext: nil, position: 0, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Beef Soup", subtext: nil, position: 1, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Chicken Soup", subtext: nil, position: 2, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Mushroom Soup", subtext: nil, position: 3, description: "surchage of rupees 20 applicable on 1 by 2 soups", price: 180, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `soupMenus` to your database or perform other actions can go here
    for menu in soupMenus {
        try await menu.save(on: req.db)
    }
}

func addAllFishItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "e034ec93-05bd-4c1c-9834-5eaafff2600a")!
    
    let fishMenus = [
        Item(name: "Chonok Rawa Fry", subtext: nil, position: 0, description: nil, price: 450, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Chonok (Plain/Masala)", subtext: nil, position: 1, description: nil, price: 500, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Shark Rawa Fry", subtext: nil, position: 2, description: nil, price: 400, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Shark (Plain/Masala)", subtext: nil, position: 3, description: nil, price: 450, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Calamari/Squid", subtext: nil, position: 4, description: nil, price: 350, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "King Fish", subtext: nil, position: 5, description: nil, price: 0, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Pomfret", subtext: "Silver", position: 6, description: nil, price: 0, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Mackerel", subtext: nil, position: 7, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Mackerel (Rechad)", subtext: nil, position: 8, description: nil, price: 200, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Sole Fish", subtext: nil, position: 9, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Bombill", subtext: "Bombay Duck", position: 10, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Stuffed Calamari/Squid", subtext: nil, position: 11, description: "Squid stuffed with recheado masala and squid tentacles", price: 400, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Local Fish", subtext: nil, position: 12, description: nil, price: 0, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `fishMenus` to your database or perform other actions can go here
    for menu in fishMenus {
        try await menu.save(on: req.db)
    }
}

func addAllSeafoodItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "71d68c76-2f4f-4d57-a7d8-6e03f42cff24")!
    
    let seafoodMenus = [
        Item(name: "Prawns", subtext: nil, position: 0, description: nil, price: 380, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Oysters", subtext: nil, position: 1, description: nil, price: 350, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Mussels", subtext: nil, position: 2, description: nil, price: 350, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Crabs", subtext: nil, position: 3, description: nil, price: 0, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `seafoodMenus` to your database or perform other actions can go here
    for menu in seafoodMenus {
        try await menu.save(on: req.db)
    }
}

func addAllVegItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "8863d780-85cb-4d01-9497-c28b1da29d72")!
    
    let vegMenus = [
        Item(name: "Mushroom Chilli Fry", subtext: nil, position: 0, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Mushroom Xacuti", subtext: nil, position: 1, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Mix Veg. Xacuti", subtext: nil, position: 2, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Gobi Manchurian", subtext: nil, position: 3, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Mixed Salad", subtext: nil, position: 4, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "French Fries", subtext: nil, position: 5, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Corn Jalapeño cheese pops", subtext: nil, position: 6, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Paneer Chilli", subtext: nil, position: 7, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `vegMenus` to your database or perform other actions can go here
    for menu in vegMenus {
        try await menu.save(on: req.db)
    }
}

func addAllChickenItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "1dff2bc9-50f0-44cc-9dff-8e14e48f38de")!
    
    let chickenMenus = [
        Item(name: "Chicken Lollipop", subtext: nil, position: 0, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Chilli Chicken", subtext: "dry/gravy", position: 1, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Chicken Manchurian", subtext: "dry/gravy", position: 2, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Crispy Chicken", subtext: nil, position: 3, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Chicken Cutlets", subtext: nil, position: 4, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Chicken Dry Fry", subtext: "pieces/leg", position: 5, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Chicken Chilli Fry", subtext: nil, position: 6, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Chicken Cafreal", subtext: "dry/gravy", position: 7, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Chicken Xacuti", subtext: nil, position: 8, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `chickenMenus` to your database or perform other actions can go here
    for menu in chickenMenus {
        try await menu.save(on: req.db)
    }
}

func addAllPorkItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "34db3c1b-a56b-4318-876b-81b18ce245d3")!
    
    let porkMenus = [
        Item(name: "Sausages", subtext: nil, position: 0, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Sausage Chilli Fry", subtext: nil, position: 1, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Sausage Bread", subtext: nil, position: 2, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Pork Chilli Fry", subtext: nil, position: 3, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Pork Roast", subtext: nil, position: 4, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Pork Amsol", subtext: nil, position: 5, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Pork Bones", subtext: "aadmas", position: 6, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Pork Chops", subtext: nil, position: 7, description: nil, price: 400, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Sorpatel", subtext: nil, position: 8, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `porkMenus` to your database or perform other actions can go here
    for menu in porkMenus {
        try await menu.save(on: req.db)
    }
}

func addAllBeefItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "c10bbb85-3411-4a74-a42f-368522f6f34b")!
    
    let beefMenus = [
        Item(name: "Beef Chilli Fry", subtext: nil, position: 0, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Beef Cutlets", subtext: nil, position: 1, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Beef Dry Fry", subtext: nil, position: 2, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Beef Tongue Roast", subtext: nil, position: 3, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Beef Roulade", subtext: nil, position: 4, description: nil, price: 350, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Beef Cafreal", subtext: nil, position: 5, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Beef Xacuti", subtext: nil, position: 6, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `beefMenus` to your database or perform other actions can go here
    for menu in beefMenus {
        try await menu.save(on: req.db)
    }
}

func addMiscItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "46a5345e-2868-4086-a5de-3ef171e53fa6")!
    
    let miscMenus = [
        Item(name: "Para", subtext: nil, position: 0, description: "Salted fish aged in a vinegar based spiced masala", price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Dry Fish Salad", subtext: nil, position: 1, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Sanna", subtext: "per piece", position: 2, description: nil, price: 40, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Bread", subtext: nil, position: 3, description: nil, price: 10, imageUrl: nil, enabled: true, categoryId: categoryId),
        Item(name: "Paratha", subtext: nil, position: 4, description: nil, price: 30, imageUrl: nil, enabled: true, categoryId: categoryId),
    ]
    
    // Additional code to save `miscMenus` to your database or perform other actions can go here
    for menu in miscMenus {
        try await menu.save(on: req.db)
    }
}

func addRiceItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "463a5987-04b3-44a4-9a61-f40d21c7335b")!
    
    let riceMenus = [
        Item(name: "Plain Rice", subtext: nil, position: 0, description: nil, price: 60, enabled: true, categoryId: categoryId),
        Item(name: "Prawn Curry Rice", subtext: nil, position: 1, description: nil, price: 290, enabled: true, categoryId: categoryId),
        Item(name: "Shark Ambot-tik Rice", subtext: nil, position: 2, description: nil, price: 290, enabled: true, categoryId: categoryId),
        Item(name: "Plain Pulao", subtext: nil, position: 3, description: nil, price: 160, enabled: true, categoryId: categoryId),
        Item(name: "Veg. Pulao", subtext: nil, position: 4, description: nil, price: 180, enabled: true, categoryId: categoryId),
        Item(name: "Chicken Pulao", subtext: nil, position: 5, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Item(name: "Beef Pulao", subtext: nil, position: 6, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Item(name: "Pork Sausage Pulao", subtext: nil, position: 7, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Item(name: "Prawns Pulao", subtext: nil, position: 8, description: nil, price: 250, enabled: true, categoryId: categoryId),
        Item(name: "Veg. Fried Rice", subtext: nil, position: 9, description: nil, price: 180, enabled: true, categoryId: categoryId),
        Item(name: "Egg Fried Rice", subtext: nil, position: 10, description: nil, price: 180, enabled: true, categoryId: categoryId),
        Item(name: "Chicken Fried Rice", subtext: nil, position: 11, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Item(name: "Beef Fried Rice", subtext: nil, position: 12, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Item(name: "Pork Sausage Fried Rice", subtext: nil, position: 13, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Item(name: "Prawns Fried Rice", subtext: nil, position: 14, description: nil, price: 250, enabled: true, categoryId: categoryId),
        Item(name: "Mixed Fried Rice", subtext: nil, position: 15, description: nil, price: 250, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `riceMenus` to your database or perform other actions can go here
    for menu in riceMenus {
        try await menu.save(on: req.db)
    }
}

func addDessertItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "3a9f9c14-9a63-4ccc-bfda-ee2f9f79d637")!
    
    let desserts = [
        Item(name: "Ice Cream", subtext: "Vanilla, chocolate, mango", position: 0, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Item(name: "Caramel Pudding", subtext: "Custard made with eggs, sugar, and milk, with a caramelized sugar bottom", position: 1, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Item(name: "Chocolate Brownie", subtext: "Chocolate brownie with cashew nuts and walnuts", position: 2, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Item(name: "Pankcakes", subtext: "Chocolate, Banana, Honey, Lemon, Coconut Jaggery", position: 3, description: nil, price: 100, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `desserts` to your database or perform other actions can go here
    for dessert in desserts {
        try await dessert.save(on: req.db)
    }
}


