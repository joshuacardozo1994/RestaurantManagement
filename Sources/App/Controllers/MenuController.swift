//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor

struct MenuController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let menusRoute = routes.grouped("items")
        
        // Protected routes (using JWT)
        let protectedMenuRoutes = menusRoute.grouped(JWTAuthMiddleware(authorizedUserTypes: [.admin]))
        protectedMenuRoutes.post(use: createMenuHandler)
        protectedMenuRoutes.put(":itemID", use: updateMenuHandler)
        protectedMenuRoutes.delete(":itemID", use: deleteMenuHandler)

        // Public routes (No JWT required)
        menusRoute.get(use: getAllMenusHandler)
        menusRoute.get(":itemID", use: getSingleMenuHandler)
        
        // Similarly, for Categories
        let categoriesRoute = routes.grouped("categories")
        
        // Protected routes
        let protectedCategoryRoutes = categoriesRoute.grouped(JWTAuthMiddleware(authorizedUserTypes: [.admin]))
        protectedCategoryRoutes.post(use: createCategoryHandler)
        protectedCategoryRoutes.put(":categoryID", use: updateCategoryHandler)
        protectedCategoryRoutes.delete(":categoryID", use: deleteCategoryHandler)
        
        // Public routes
        categoriesRoute.get(use: getAllCategoriesHandler)
        categoriesRoute.get(":categoryID", use: getSingleCategoryHandler)
    }
    
    // MARK: - Menu Handlers
    func createMenuHandler(_ req: Request) async throws -> Item {
        let menu = try req.content.decode(Item.self)
        try await menu.save(on: req.db)
        return menu
    }
    
    func getAllMenusHandler(_ req: Request) async throws -> [Item] {
        return try await Item.query(on: req.db).all()
    }
    
    func getSingleMenuHandler(_ req: Request) async throws -> Item {
        guard let menu = try await Item.find(req.parameters.get("itemID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return menu
    }
    
    func updateMenuHandler(_ req: Request) async throws -> Item {
        let updatedMenu = try req.content.decode(Item.self)
        
        guard let menu = try await Item.find(req.parameters.get("itemID"), on: req.db) else {
            throw Abort(.notFound)
        }
        menu.name = updatedMenu.name
        menu.description = updatedMenu.description
        menu.price = updatedMenu.price
        menu.imageUrl = updatedMenu.imageUrl
        menu.enabled = updatedMenu.enabled
        menu.subtext = updatedMenu.subtext
        menu.description = updatedMenu.description
        try await menu.save(on: req.db)
        return menu
    }
    
    func deleteMenuHandler(_ req: Request) async throws -> HTTPStatus {
        guard let menu = try await Item.find(req.parameters.get("itemID"), on: req.db) else {
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
        let categories = try await Category.query(on: req.db)
            .with(\.$items)
            .all()
            .sorted { $0.position < $1.position }
        
        let convertedCategories = try categories.map { cat in
            let newItems = try cat.items.sorted { $0.position < $1.position }.map { men in
                ItemResponse(id: try men.requireID(), name: men.name, subtext: men.subtext, description: men.description, price: men.price, imageUrl: men.imageUrl, enabled: men.enabled)
            }
            let newCat = CategoryResponse(id: try cat.requireID(), name: cat.name, description: cat.description, type: cat.type, items: newItems)
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

