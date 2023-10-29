//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Fluent

struct CreateMenu: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("menus")
            .id()
            .field("name", .string, .required)
            .field("subtext", .string)
            .field("position", .int, .required)
            .field("description", .string)
            .field("price", .double, .required)
            .field("image_url", .string)
            .field("enabled", .bool)
            .field("category_id", .uuid, .required, .references("categories", "id"))
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("menus").delete()
    }
}

