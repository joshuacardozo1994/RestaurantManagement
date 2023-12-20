//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 11/11/23.
//

import Vapor

struct TableController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let tablesRoute = routes.grouped("tables")
        let protectedTablesRouteRoutes = tablesRoute.grouped(JWTAuthMiddleware(authorizedUserTypes: [.admin]))
        
        protectedTablesRouteRoutes.get(use: getAllTablesHandler)
        protectedTablesRouteRoutes.get(":tableID", use: getSingleTableHandler)
        protectedTablesRouteRoutes.post(use: createTableHandler)
        protectedTablesRouteRoutes.put(":tableID", use: updateTableHandler)
        protectedTablesRouteRoutes.delete(":tableID", use: deleteTableHandler)
    }
    
    // MARK: - Table Handlers
    
    /// Retrieves all ``Table`` instances from the database, along with their associated ``Table/currentStaff`` and ``Table/bill``.
    ///
    /// This asynchronous function fetches all records from the `tables` table and performs eager loading of related `currentStaff` and `bill` for each `Table`. This is done to efficiently gather and return all related data in a single API call.
    ///
    /// - Parameter req: The `Request` object containing all information about the client's request.
    ///
    /// - Returns: An array of `Table` objects, each with their `currentStaff` (User) and `bill` (Bill) loaded if they exist.
    ///
    /// - Throws: An error if the database query fails or if there is an issue with fetching the data.
    ///
    /// Usage:
    /// This function can be used in a route handler to provide an endpoint that returns details about all tables in a restaurant or similar setting. The data includes information about the staff assigned to each table and the bill associated with it.
    ///
    /// Example:
    /// ```
    /// app.get("tables", use: getAllTablesHandler)
    /// ```
    ///
    /// - Note: This function may perform multiple database queries depending on the number of tables, as it eager loads relations for each table individually. Consider optimizing the data retrieval strategy if performance is a concern.
    func getAllTablesHandler(_ req: Request) async throws -> [Table] {
        // Fetch all tables
        let tables = try await Table.query(on: req.db).all()

        // Eager load 'currentStaff' and 'bill' for each table
        for table in tables {
            try await table.$currentStaff.load(on: req.db)
            try await table.$bill.load(on: req.db)
        }

        return tables
    }
    
    func getSingleTableHandler(_ req: Request) async throws -> Table {
        guard let table = try await Table.find(req.parameters.get("tableID"), on: req.db) else {
            throw Abort(.notFound)
        }
        return table
    }
    
    func createTableHandler(_ req: Request) async throws -> Table {
        let number = try req.content.decode(TableRequest.self).number
        let table = Table(number: number)
        try await table.save(on: req.db)
        return table
    }
    
    func updateTableHandler(_ req: Request) async throws -> Table {
        let updatedTable = try req.content.decode(Table.self)
        
        guard let table = try await Table.find(req.parameters.get("tableID"), on: req.db) else {
            throw Abort(.notFound)
        }
        
        table.number = updatedTable.number
        
        try await table.save(on: req.db)
        return table
    }
        
    func deleteTableHandler(_ req: Request) async throws -> HTTPStatus {
        guard let table = try await Table.find(req.parameters.get("tableID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await table.delete(on: req.db)
        return .ok
    }
}
