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
        let protectedOrderRoutes = ordersRoute.grouped(JWTAuthMiddleware())
        
        protectedOrderRoutes.get(use: getAllOrdersHandler)
        protectedOrderRoutes.get(":orderID", use: getSingleOrderHandler)
        protectedOrderRoutes.post(use: createOrderHandler)
        protectedOrderRoutes.put(":orderID", use: updateOrderHandler)
        protectedOrderRoutes.delete(":orderID", use: deleteOrderHandler)
        
        
        let billsRoute = routes.grouped("bills")
        let protectedBillRoutes = billsRoute.grouped(JWTAuthMiddleware())
        
        protectedBillRoutes.get(use: getAllBillsHandler)
        protectedBillRoutes.get(":billID", use: getSingleBillHandler)
        protectedBillRoutes.post(use: createBillHandler)
        protectedBillRoutes.put(":billID", use: updateBillHandler)
        protectedBillRoutes.delete(":billID", use: deleteBillHandler)


        
    }
    
    // MARK: - Order Handlers
    
    func getAllOrdersHandler(_ req: Request) async throws -> [Order] {
        try await Order.query(on: req.db).with(\.$item).all()
    }

    func getSingleOrderHandler(_ req: Request) async throws -> Order {
        guard let order = try await Order.find(req.parameters.get("orderID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return order
    }
    
    func createOrderHandler(_ req: Request) async throws -> Order {
        let order = try req.content.decode(Order.self)
        try await order.save(on: req.db)
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
    
    // MARK: - Bill Handlers
    func getAllBillsHandler(_ req: Request) async throws -> [Bill] {
        try await Bill.query(on: req.db).with(\.$orders).all()
    }

    func getSingleBillHandler(_ req: Request) async throws -> Bill {
        guard let bill = try await Bill.find(req.parameters.get("billID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return bill
    }
    
    func createBillHandler(_ req: Request) async throws -> Bill {
        let bill = try req.content.decode(Bill.self)
        try await bill.save(on: req.db)
        return bill
    }
    
    func updateBillHandler(_ req: Request) async throws -> Bill {
        let updatedBill = try req.content.decode(Bill.self)
        
        guard let bill = try await Bill.find(req.parameters.get("billID"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        bill.orders = updatedBill.orders
        bill.status = updatedBill.status
        bill.table = updatedBill.table

        
        try await bill.save(on: req.db)
        return bill
    }
        
    func deleteBillHandler(_ req: Request) async throws -> HTTPStatus {
        guard let bill = try await Bill.find(req.parameters.get("billID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await bill.delete(on: req.db)
        return .ok
    }
    
    
}


