//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Vapor

struct OrderController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let ordersRoute = routes.grouped("orders")
        
        // Protected routes (using JWT)
        let protectedOrderRoutes = ordersRoute.grouped(JWTAuthMiddleware())
        protectedOrderRoutes.post(use: createOrderHandler)
        protectedOrderRoutes.put(":orderID", use: updateOrderHandler)
        protectedOrderRoutes.delete(":orderID", use: deleteOrderHandler)
        
        protectedOrderRoutes.get(use: getAllOrdersHandler)
        protectedOrderRoutes.get(":orderID", use: getSingleOrderHandler)


        
    }
    
    // MARK: - Order Handlers
    func createOrderHandler(_ req: Request) async throws -> Order {
        let order = try req.content.decode(Order.self)
        try await order.save(on: req.db)
        return order
    }
    
    func getAllOrdersHandler(_ req: Request) async throws -> [Order] {
        try await Order.query(on: req.db).with(\.$item).all()
    }

    func getSingleOrderHandler(_ req: Request) async throws -> Order {
        guard let order = try await Order.find(req.parameters.get("orderID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return order
    }
    
    func updateOrderHandler(_ req: Request) async throws -> Order {
        let updatedOrder = try req.content.decode(Order.self)
        
        guard let order = try await Order.find(req.parameters.get("orderID"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        order.item = updatedOrder.item
        order.quantity = updatedOrder.quantity
        
        try await order.save(on: req.db)
        return order
    }
        
    func deleteOrderHandler(_ req: Request) async throws -> HTTPStatus {
        guard let order = try await Order.find(req.parameters.get("orderID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await order.delete(on: req.db)
        return .ok
    }
}


