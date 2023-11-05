//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 05/11/23.
//

import Fluent
import Vapor

struct MenuSeeder: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await MenuHelper.addAllCategories(database)
    }
    
    func revert(on database: Database) async throws {
        try await Item.query(on: database).delete()
        try await Category.query(on: database).delete()
    }
}
