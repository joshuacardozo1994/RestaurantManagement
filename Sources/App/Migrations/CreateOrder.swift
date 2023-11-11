//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent

struct CreateOrder: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Order.schema)
            .id()
            .field("quantity", .int, .required)
            .field("item_id", .uuid, .required, .references("items", "id"))
            .field("bill_id", .uuid, .required, .references("bills", "id"))
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Order.schema).delete()
    }
}
