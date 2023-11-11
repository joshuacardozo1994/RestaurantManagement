//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Fluent

struct CreateItem: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("items")
            .id()
            .field("name", .string, .required)
            .field("subtext", .string)
            .field("position", .int, .required)
            .field("description", .string)
            .field("price", .double, .required)
            .field("image_url", .string)
            .field("enabled", .bool)
            .field("category_id", .uuid, .required, .references("categories", "id"))
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("items").delete()
    }
}

