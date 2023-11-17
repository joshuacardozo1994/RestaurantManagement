//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//
import Fluent

struct CreateUser: AsyncMigration {
    // Prepare the database to store User objects
    func prepare(on database: Database) async throws {
        try await database.schema(User.schema)
            .id()
            .field("username", .string, .required)
            .field("password_hash", .string, .required)
            .field("email", .string, .required)
            .field("type", .string, .required)
            .field("verified", .bool, .required)
            .unique(on: "username") // Ensures that usernames are unique
            .unique(on: "email")    // Ensures that emails are unique
            .field("profile_picture", .string)
            .field("created_at", .datetime)
            .field("updated_at", .datetime)
            .create()
    }

    // Revert the changes made in the prepare method
    func revert(on database: Database) async throws {
        try await database.schema(User.schema).delete()
    }
}
