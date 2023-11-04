//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent

struct CreateTable: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("tables")
            .id()
            .field("number", .int, .required)
            .field("current_staff_id", .uuid, .references("users", "id"))
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("tables").delete()
    }
}

