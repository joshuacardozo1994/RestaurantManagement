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
    let categoryId = UUID(uuidString: "F6AD7F37-E489-4C63-B15C-A2F0FC19A22A")!
    
    let beverages = [
        Menu(name: "Soda", subtext: nil, position: 0, description: nil, price: 20, enabled: true, categoryId: categoryId),
        Menu(name: "Soft Drinks", subtext: "Coca-cola, Limca, Sprite, Thums up", position: 1, description: nil, price: 30, enabled: true, categoryId: categoryId),
        Menu(name: "Coca-cola", subtext: nil, position: 1, description: nil, price: 30, enabled: false, categoryId: categoryId),
        Menu(name: "Limca", subtext: nil, position: 1, description: nil, price: 30, enabled: false, categoryId: categoryId),
        Menu(name: "Sprite", subtext: nil, position: 1, description: nil, price: 30, enabled: false, categoryId: categoryId),
        Menu(name: "Thums up", subtext: nil, position: 1, description: nil, price: 30, enabled: false, categoryId: categoryId),
        Menu(name: "Tonic Water", subtext: nil, position: 2, description: nil, price: 90, enabled: true, categoryId: categoryId),
        Menu(name: "Fresh Lemon Soda", subtext: nil, position: 3, description: nil, price: 90, enabled: true, categoryId: categoryId),
        Menu(name: "Fresh Lemon Water", subtext: nil, position: 4, description: nil, price: 70, enabled: true, categoryId: categoryId),
        Menu(name: "Fresh Ginger Lemon Soda", subtext: nil, position: 5, description: nil, price: 120, enabled: true, categoryId: categoryId),
        Menu(name: "Orange/Mango Juice", subtext: "canned", position: 6, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Menu(name: "Orange Juice", subtext: "canned", position: 6, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Menu(name: "Mango Juice", subtext: "canned", position: 6, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Menu(name: "Mineral Water", subtext: nil, position: 7, description: nil, price: 30, enabled: true, categoryId: categoryId)
    ]

    // Additional code to save `beverages` to your database or perform other actions can go here
    for beverage in beverages {
        try await beverage.save(on: req.db)
    }
}

func addCoffeeTeaItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "0ED931A8-44E3-464B-BB2D-7B56AA3EEAD4")!

    let coffeeTeaItems = [
        Menu(name: "Milk Coffee", subtext: nil, position: 0, description: nil, price: 40, enabled: true, categoryId: categoryId),
        Menu(name: "Black Coffee", subtext: nil, position: 1, description: nil, price: 30, enabled: true, categoryId: categoryId),
        Menu(name: "Black Tea", subtext: nil, position: 2, description: nil, price: 20, enabled: true, categoryId: categoryId)
    ]

    // Additional code to save `coffeeTeaItems` to your database can go here.
    for item in coffeeTeaItems {
        try await item.save(on: req.db)
    }
}

func addAllMocktails(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "EEAF6FAD-3860-494B-806F-75E4B1F1923A")!
    let menus = [
        Menu(name: "Mock Whiskey", position: 0, description: "Apple juice, lime juice, ginger ale, lime juice, soda", price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Virgin Mojito", position: 1, description: "Mint, lime juice, sugar, soda, served over ice", price: 220, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Virgin Passion Fruit Mojito", position: 2, description: "Passion fruit, mint, lime juice, sugar, soda, served over ice", price: 240, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Virgin Watermelon Mojito", position: 3, description: "Watermelon, mint, lime juice, sugar, soda, served over ice", price: 240, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Iced Tea", position: 4, description: "Lemon", price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Shirley Temple", position: 5, description: "Lemon juice, strawberry syrup, soda, served on ice", price: 200, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Fruit Punch", position: 6, description: "Mixed fruits blended with milk and ice", price: 200, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    for menu in menus {
        try await menu.save(on: req.db)
    }
}

func addAllCocktails(_ req: Request) async throws {
    let newCategoryId = UUID(uuidString: "394AFD8F-7E20-4238-8081-1B479C58F6B9")!

    let menus = [
        Menu(name: "Mojito", position: 0, description: "White rum, mint, lime juice, sugar, soda, served over ice", price: 280, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Menu(name: "Passion Fruit Mojito", position: 1, description: "White rum, passion fruit, mint, lime juice, soda, served over ice", price: 300, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Menu(name: "Watermelon Mojito", position: 2, description: "White rum, watermelon, mint, lime juice, soda, served over ice", price: 300, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Menu(name: "Gimlet", position: 3, description: "Gin, simple syrup, lemon juice, served chilled ", price: 300, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Menu(name: "Tequila Sunrise", position: 4, description: "Tequila, lemon juice, orange juice, served chilled", price: 350, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Menu(name: "Durigo Special", position: 5, description: "White rum, lemon juice, orange juice, strawberry syrup, served chilled", price: 350, imageUrl: nil, enabled: true, categoryId: newCategoryId),
        Menu(name: "Purple Margarita", position: 6, description: "Butterfly pea tea, fresh lime juice, plus the right amount of tequila and triple sec", price: 400, imageUrl: nil, enabled: true, categoryId: newCategoryId)
    ]
    
    for menu in menus {
        try await menu.save(on: req.db)
    }
}

func addAllVodkas(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "DCBE791E-2814-43CE-9EFB-A9FC5F2EA892")!
    
    let vodkaMenus = [
        Menu(name: "Smirnoff", position: 0, description: nil, price: 100, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Romanov", position: 1, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Grey Goose", position: 2, description: nil, price: 390, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Absolut", position: 3, description: nil, price: 380, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    for menu in vodkaMenus {
        try await menu.save(on: req.db)
    }
}

func addAllWhiskeys(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "884BC23F-EB2C-4331-8E65-9F230548B044")!
    
    let whiskeyMenus = [
        Menu(name: "Black Dog", position: 0, description: nil, price: 190, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Black & White", position: 1, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Teachers", position: 2, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Vat 69", position: 3, description: nil, price: 140, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Blenders Pride", position: 4, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Peter Scot", position: 5, description: nil, price: 80, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Signature", position: 6, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Royal Challenge", position: 7, description: nil, price: 60, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Royal Stag", position: 8, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Mc Dowell's", position: 9, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Jack Daniels", position: 10, description: nil, price: 320, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "100 Pipers", position: 11, description: nil, price: 200, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `whiskeyMenus` to your database or perform other actions can go here
    for menu in whiskeyMenus {
        try await menu.save(on: req.db)
    }
}

func addAllRums(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "B5C4E50E-7381-46E9-B590-1BEB86638CAB")!
    
    let rumMenus = [
        Menu(name: "Old Monk", subtext: nil, position: 0, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Bacardi", subtext: "White", position: 1, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Bacardi", subtext: "Limon", position: 2, description: nil, price: 100, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Bacardi", subtext: "Black", position: 3, description: nil, price: 80, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Makazai", subtext: "White", position: 4, description: nil, price: 140, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Makazai", subtext: "Gold", position: 5, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `rumMenus` to your database or perform other actions can go here
    for menu in rumMenus {
        try await menu.save(on: req.db)
    }
}

func addAllBrandies(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "BCB10848-E787-472F-A17F-D04297E49CBC")!
    
    let brandyMenus = [
        Menu(name: "Honey Bee", subtext: nil, position: 0, description: nil, price: 40, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Mansion House", subtext: nil, position: 1, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `brandyMenus` to your database or perform other actions can go here
    for menu in brandyMenus {
        try await menu.save(on: req.db)
    }
}

func addAllWines(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "9B5C5F06-A68B-485A-A379-530C3C203810")!
    
    let wineMenus = [
        Menu(name: "Madeira", subtext: "Red/White", position: 0, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Port Wine", subtext: nil, position: 1, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `wineMenus` to your database or perform other actions can go here
    for menu in wineMenus {
        try await menu.save(on: req.db)
    }
}

func addAllLocalDrinks(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "9E70F1E4-0192-4781-9589-18509DDBD5AE")!
    
    let localDrinkMenus = [
        Menu(name: "Urak", subtext: nil, position: 0, description: nil, price: 40, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Cashew/Kaju Feni", subtext: nil, position: 1, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Ginger Feni", subtext: nil, position: 2, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Dudshiri", subtext: nil, position: 3, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `localDrinkMenus` to your database or perform other actions can go here
    for menu in localDrinkMenus {
        try await menu.save(on: req.db)
    }
}

func addAllGins(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "FC31FF9F-D075-4616-A8D2-27ED49286065")!
    
    let ginMenus = [
        Menu(name: "Blue Ribbon", subtext: nil, position: 0, description: nil, price: 50, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Greater than (London Dry)", subtext: nil, position: 1, description: nil, price: 120, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Seqer", subtext: nil, position: 2, description: nil, price: 170, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Sativa", subtext: nil, position: 3, description: nil, price: 190, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `ginMenus` to your database or perform other actions can go here
    for menu in ginMenus {
        try await menu.save(on: req.db)
    }
}

func addAllBeers(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "59734EA1-8ADF-499B-82B4-8E74B3DF74EF")!
    
    let beerMenus = [
        Menu(name: "Kingfisher", subtext: "Q", position: 0, description: nil, price: 140, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Kingfisher", subtext: "P", position: 1, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Tuborg", subtext: nil, position: 2, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Budweiser", subtext: "C", position: 3, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Breezer", subtext: nil, position: 4, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Corona", subtext: nil, position: 5, description: nil, price: 170, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Hoegaarden", subtext: nil, position: 6, description: nil, price: 170, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Kings", subtext: nil, position: 7, description: nil, price: 100, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "People's Lager", subtext: nil, position: 8, description: nil, price: 120, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `beerMenus` to your database or perform other actions can go here
    for menu in beerMenus {
        try await menu.save(on: req.db)
    }
}

func addAllSoups(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "622007BE-3FDF-4459-BDC8-5CE294261C91")!
    
    let soupMenus = [
        Menu(name: "Veg. Soup", subtext: nil, position: 0, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Beef Soup", subtext: nil, position: 1, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Chicken Soup", subtext: nil, position: 2, description: nil, price: 160, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Mushroom Soup", subtext: nil, position: 3, description: "surchage of rupees 20 applicable on 1 by 2 soups", price: 180, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `soupMenus` to your database or perform other actions can go here
    for menu in soupMenus {
        try await menu.save(on: req.db)
    }
}

func addAllFishItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "5E3E155F-9EF0-49E9-B043-284AE264B04C")!
    
    let fishMenus = [
        Menu(name: "Chonok Rawa Fry", subtext: nil, position: 0, description: nil, price: 450, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Chonok (Plain/Masala)", subtext: nil, position: 1, description: nil, price: 500, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Shark Rawa Fry", subtext: nil, position: 2, description: nil, price: 400, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Shark (Plain/Masala)", subtext: nil, position: 3, description: nil, price: 450, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Calamari/Squid", subtext: nil, position: 4, description: nil, price: 350, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "King Fish", subtext: nil, position: 5, description: nil, price: 0, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Pomfret", subtext: "Silver", position: 6, description: nil, price: 0, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Mackerel", subtext: nil, position: 7, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Mackerel (Rechad)", subtext: nil, position: 8, description: nil, price: 200, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Sole Fish", subtext: nil, position: 9, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Bombill", subtext: "Bombay Duck", position: 10, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Stuffed Calamari/Squid", subtext: nil, position: 11, description: "Squid stuffed with recheado masala and squid tentacles", price: 400, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Local Fish", subtext: nil, position: 12, description: nil, price: 0, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `fishMenus` to your database or perform other actions can go here
    for menu in fishMenus {
        try await menu.save(on: req.db)
    }
}

func addAllSeafoodItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "86764196-0F60-4973-A763-E0310A017AEF")!
    
    let seafoodMenus = [
        Menu(name: "Prawns", subtext: nil, position: 0, description: nil, price: 380, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Oysters", subtext: nil, position: 1, description: nil, price: 350, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Mussels", subtext: nil, position: 2, description: nil, price: 350, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Crabs", subtext: nil, position: 3, description: nil, price: 0, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `seafoodMenus` to your database or perform other actions can go here
    for menu in seafoodMenus {
        try await menu.save(on: req.db)
    }
}

func addAllVegItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "4EDC5257-6D5B-433C-A97F-A3D3A7B3EBDB")!
    
    let vegMenus = [
        Menu(name: "Mushroom Chilli Fry", subtext: nil, position: 0, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Mushroom Xacuti", subtext: nil, position: 1, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Mix Veg. Xacuti", subtext: nil, position: 2, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Gobi Manchurian", subtext: nil, position: 3, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Mixed Salad", subtext: nil, position: 4, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "French Fries", subtext: nil, position: 5, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Corn Jalapeño cheese pops", subtext: nil, position: 6, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Paneer Chilli", subtext: nil, position: 7, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `vegMenus` to your database or perform other actions can go here
    for menu in vegMenus {
        try await menu.save(on: req.db)
    }
}

func addAllChickenItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "AB63D513-919D-45D3-A8AD-48F31353420F")!
    
    let chickenMenus = [
        Menu(name: "Chicken Lollipop", subtext: nil, position: 0, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Chilli Chicken", subtext: "dry/gravy", position: 1, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Chicken Manchurian", subtext: "dry/gravy", position: 2, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Crispy Chicken", subtext: nil, position: 3, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Chicken Cutlets", subtext: nil, position: 4, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Chicken Dry Fry", subtext: "pieces/leg", position: 5, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Chicken Chilli Fry", subtext: nil, position: 6, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Chicken Cafreal", subtext: "dry/gravy", position: 7, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Chicken Xacuti", subtext: nil, position: 8, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `chickenMenus` to your database or perform other actions can go here
    for menu in chickenMenus {
        try await menu.save(on: req.db)
    }
}

func addAllPorkItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "C46973E0-8358-445A-B81F-52C072646FE5")!
    
    let porkMenus = [
        Menu(name: "Sausages", subtext: nil, position: 0, description: nil, price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Sausage Chilli Fry", subtext: nil, position: 1, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Sausage Bread", subtext: nil, position: 2, description: nil, price: 90, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Pork Chilli Fry", subtext: nil, position: 3, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Pork Roast", subtext: nil, position: 4, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Pork Amsol", subtext: nil, position: 5, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Pork Bones", subtext: "aadmas", position: 6, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Pork Chops", subtext: nil, position: 7, description: nil, price: 400, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Sorpatel", subtext: nil, position: 8, description: nil, price: 280, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `porkMenus` to your database or perform other actions can go here
    for menu in porkMenus {
        try await menu.save(on: req.db)
    }
}

func addAllBeefItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "60F34A7E-B39A-4C76-9360-5053E035340C")!
    
    let beefMenus = [
        Menu(name: "Beef Chilli Fry", subtext: nil, position: 0, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Beef Cutlets", subtext: nil, position: 1, description: nil, price: 250, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Beef Dry Fry", subtext: nil, position: 2, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Beef Tongue Roast", subtext: nil, position: 3, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Beef Roulade", subtext: nil, position: 4, description: nil, price: 350, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Beef Cafreal", subtext: nil, position: 5, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Beef Xacuti", subtext: nil, position: 6, description: nil, price: 300, imageUrl: nil, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `beefMenus` to your database or perform other actions can go here
    for menu in beefMenus {
        try await menu.save(on: req.db)
    }
}

func addMiscItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "A485745A-219E-4584-9BAB-3DEC8880D0CC")!
    
    let miscMenus = [
        Menu(name: "Para", subtext: nil, position: 0, description: "Salted fish aged in a vinegar based spiced masala", price: 150, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Dry Fish Salad", subtext: nil, position: 1, description: nil, price: 180, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Sanna", subtext: "per piece", position: 2, description: nil, price: 40, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Bread", subtext: nil, position: 3, description: nil, price: 10, imageUrl: nil, enabled: true, categoryId: categoryId),
        Menu(name: "Paratha", subtext: nil, position: 4, description: nil, price: 30, imageUrl: nil, enabled: true, categoryId: categoryId),
    ]
    
    // Additional code to save `miscMenus` to your database or perform other actions can go here
    for menu in miscMenus {
        try await menu.save(on: req.db)
    }
}

func addRiceItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "58A957D7-9483-44F2-8076-205BAEAB2B36")!
    
    let riceMenus = [
        Menu(name: "Plain Rice", subtext: nil, position: 0, description: nil, price: 60, enabled: true, categoryId: categoryId),
        Menu(name: "Prawn Curry Rice", subtext: nil, position: 1, description: nil, price: 290, enabled: true, categoryId: categoryId),
        Menu(name: "Shark Ambot-tik Rice", subtext: nil, position: 2, description: nil, price: 290, enabled: true, categoryId: categoryId),
        Menu(name: "Plain Pulao", subtext: nil, position: 3, description: nil, price: 160, enabled: true, categoryId: categoryId),
        Menu(name: "Veg. Pulao", subtext: nil, position: 4, description: nil, price: 180, enabled: true, categoryId: categoryId),
        Menu(name: "Chicken Pulao", subtext: nil, position: 5, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Menu(name: "Beef Pulao", subtext: nil, position: 6, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Menu(name: "Pork Sausage Pulao", subtext: nil, position: 7, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Menu(name: "Prawns Pulao", subtext: nil, position: 8, description: nil, price: 250, enabled: true, categoryId: categoryId),
        Menu(name: "Veg. Fried Rice", subtext: nil, position: 9, description: nil, price: 180, enabled: true, categoryId: categoryId),
        Menu(name: "Egg Fried Rice", subtext: nil, position: 10, description: nil, price: 180, enabled: true, categoryId: categoryId),
        Menu(name: "Chicken Fried Rice", subtext: nil, position: 11, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Menu(name: "Beef Fried Rice", subtext: nil, position: 12, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Menu(name: "Pork Sausage Fried Rice", subtext: nil, position: 13, description: nil, price: 200, enabled: true, categoryId: categoryId),
        Menu(name: "Prawns Fried Rice", subtext: nil, position: 14, description: nil, price: 250, enabled: true, categoryId: categoryId),
        Menu(name: "Mixed Fried Rice", subtext: nil, position: 15, description: nil, price: 250, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `riceMenus` to your database or perform other actions can go here
    for menu in riceMenus {
        try await menu.save(on: req.db)
    }
}

func addDessertItems(_ req: Request) async throws {
    let categoryId = UUID(uuidString: "AC21E3F5-628A-47F3-B087-B0832E4E47B2")!
    
    let desserts = [
        Menu(name: "Ice Cream", subtext: "Vanilla, chocolate, mango", position: 0, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Menu(name: "Caramel Pudding", subtext: "Custard made with eggs, sugar, and milk, with a caramelized sugar bottom", position: 1, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Menu(name: "Chocolate Brownie", subtext: "Chocolate brownie with cashew nuts and walnuts", position: 2, description: nil, price: 100, enabled: true, categoryId: categoryId),
        Menu(name: "Pankcakes", subtext: "Chocolate, Banana, Honey, Lemon, Coconut Jaggery", position: 3, description: nil, price: 100, enabled: true, categoryId: categoryId)
    ]
    
    // Additional code to save `desserts` to your database or perform other actions can go here
    for dessert in desserts {
        try await dessert.save(on: req.db)
    }
}


