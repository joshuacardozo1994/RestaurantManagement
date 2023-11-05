//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 05/11/23.
//

import Fluent
import Vapor

struct UserSeeder: AsyncMigration {
    func prepare(on database: Database) async throws {
        let users = [
            User(username: "joshuacardozo", type: .admin, passwordHash: try Bcrypt.hash("joshuacardozo"), email: "joshua.cardozo@gmail.com"),
            User(username: "amandacardozo", type: .admin, passwordHash: try Bcrypt.hash("amandacardozo"), email: "amanda.cardozo@gmail.com"),
            User(username: "monicacardozo", type: .admin, passwordHash: try Bcrypt.hash("monicacardozo"), email: "monica.cardozo@gmail.com")
        ]
        
        for user in users {
            try await user.create(on: database)
        }
    }
    
    func revert(on database: Database) async throws {
        try await User.query(on: database).delete()
    }
}
