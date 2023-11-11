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
            .unique(on: "number")
            .field("current_staff_id", .uuid, .references("users", "id"))
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("tables").delete()
    }
}

