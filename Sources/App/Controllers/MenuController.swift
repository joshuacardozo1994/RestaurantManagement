//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor

struct MenuController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let menusRoute = routes.grouped("menus")
        
        // Protected routes (using JWT)
        let protectedMenuRoutes = menusRoute.grouped(JWTAuthMiddleware())
        protectedMenuRoutes.post(use: createMenuHandler)
        protectedMenuRoutes.put(":menuID", use: updateMenuHandler)
        protectedMenuRoutes.delete(":menuID", use: deleteMenuHandler)

        // Public routes (No JWT required)
        menusRoute.get(use: getAllMenusHandler)
        menusRoute.get(":menuID", use: getSingleMenuHandler)
        
        // Similarly, for Categories
        let categoriesRoute = routes.grouped("categories")
        
        // Protected routes
        let protectedCategoryRoutes = categoriesRoute.grouped(JWTAuthMiddleware())
        protectedCategoryRoutes.post(use: createCategoryHandler)
        protectedCategoryRoutes.put(":categoryID", use: updateCategoryHandler)
        protectedCategoryRoutes.delete(":categoryID", use: deleteCategoryHandler)
        
        // Public routes
        categoriesRoute.get(use: getAllCategoriesHandler)
        categoriesRoute.get(":categoryID", use: getSingleCategoryHandler)
    }
    
    // MARK: - Menu Handlers
    func createMenuHandler(_ req: Request) async throws -> Menu {
        let menu = try req.content.decode(Menu.self)
        try await menu.save(on: req.db)
        return menu
    }
    
    func getAllMenusHandler(_ req: Request) async throws -> [Menu] {
        return try await Menu.query(on: req.db).all()
    }
    
    func getSingleMenuHandler(_ req: Request) async throws -> Menu {
        guard let menu = try await Menu.find(req.parameters.get("menuID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return menu
    }
    
    func updateMenuHandler(_ req: Request) async throws -> Menu {
        let updatedMenu = try req.content.decode(Menu.self)
        
        guard let menu = try await Menu.find(req.parameters.get("menuID"), on: req.db) else {
            throw Abort(.notFound)
        }
        menu.name = updatedMenu.name
        menu.description = updatedMenu.description
        menu.price = updatedMenu.price
        menu.imageUrl = updatedMenu.imageUrl
        try await menu.save(on: req.db)
        return menu
    }
    
    func deleteMenuHandler(_ req: Request) async throws -> HTTPStatus {
        guard let menu = try await Menu.find(req.parameters.get("menuID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await menu.delete(on: req.db)
        return .ok
    }
    
    // MARK: - Category Handlers
    func createCategoryHandler(_ req: Request) async throws -> Category {
        let category = try req.content.decode(Category.self)
        try await category.save(on: req.db)
        return category
    }
    
    func getAllCategoriesHandler(_ req: Request) async throws -> [CategoryResponse] {
        
//        let categories = [
//            Category(name: "Beverages", position: 0, description: nil, type: .drinks),
//            Category(name: "Hot beverages", position: 1, description: nil, type: .drinks),
//            Category(name: "Mocktails", position: 2, description: nil, type: .drinks),
//            Category(name: "Cocktails", position: 3, description: nil, type: .drinks),
//            Category(name: "Vodka (60ml)", position: 4, description: nil, type: .drinks),
//            Category(name: "Whiskey", position: 5, description: nil, type: .drinks),
//            Category(name: "Rum (60ml)", position: 6, description: nil, type: .drinks),
//            Category(name: "Brandy (60ml)", position: 7, description: nil, type: .drinks),
//            Category(name: "Wine", position: 8, description: nil, type: .drinks),
//            Category(name: "Local Favourites (60ml)", position: 9, description: nil, type: .drinks),
//            Category(name: "Gin (60ml)", position: 10, description: nil, type: .drinks),
//            Category(name: "Others", position: 11, description: nil, type: .drinks),
//            Category(name: "Soups", position: 12, description: nil, type: .food),
//            Category(name: "Fish", position: 13, description: nil, type: .food),
//            Category(name: "Shell Fish", position: 14, description: nil, type: .food),
//            Category(name: "Veg", position: 15, description: nil, type: .food),
//            Category(name: "Chicken", position: 16, description: nil, type: .food),
//            Category(name: "Pork", position: 17, description: nil, type: .food),
//            Category(name: "Beef", position: 18, description: nil, type: .food),
//            Category(name: "Others", position: 19, description: nil, type: .food),
//            Category(name: "Rice", position: 20, description: nil, type: .food),
//            Category(name: "Desserts", position: 21, description: nil, type: .food),
//        ]
//        
//        Task {
//            for category in categories {
//                try await category.save(on: req.db)
//            }
//        }
//        
//        return categories
        
        let categories = try await Category.query(on: req.db)
            .with(\.$menus)
            .all()
            .sorted { $0.position < $1.position }
        
        let convertedCategories = try categories.map { cat in
            let newMenus = try cat.menus.sorted { $0.position < $1.position }.map { men in
                MenuResponse(id: try men.requireID(), name: men.name, description: men.description, price: men.price, imageUrl: men.imageUrl, enabled: men.enabled)
            }
            let newCat = CategoryResponse(id: try cat.requireID(), name: cat.name, description: cat.description, type: cat.type, menus: newMenus)
            return newCat
        }
        
        return convertedCategories
    }

    
    func getSingleCategoryHandler(_ req: Request) async throws -> Category {
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return category
    }
    
    func updateCategoryHandler(_ req: Request) async throws -> Category {
        let updatedCategory = try req.content.decode(Category.self)
        
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }
        category.name = updatedCategory.name
        category.description = updatedCategory.description
        category.type = updatedCategory.type
        try await category.save(on: req.db)
        return category
    }
    
    func deleteCategoryHandler(_ req: Request) async throws -> HTTPStatus {
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await category.delete(on: req.db)
        return .ok
    }
}

