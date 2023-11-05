//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent

struct CreateBill: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Bill.schema)
            .id()
            .field("table_id", .uuid, .required, .references("tables", "id"))
            .field("status", .string, .required, .custom("DEFAULT 'open'"))
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Bill.schema).delete()
    }
}

