//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Fluent

struct CreateCategory: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("categories")
            .id()
            .field("name", .string, .required)
            .field("position", .int, .required)
            .field("description", .string)
            .field("type", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("categories").delete()
    }
}

