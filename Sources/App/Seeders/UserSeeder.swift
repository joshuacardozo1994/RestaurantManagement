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
        if let adminUsername = Environment.get("ADMIN_USERNAME"), let adminPassword = Environment.get("ADMIN_PASSWORD"), let adminEmail = Environment.get("ADMIN_EMAIL") {
            let adminUser = User(username: adminUsername, type: .admin, verified: true, passwordHash: try Bcrypt.hash(adminPassword), email: adminEmail)
            try await adminUser.create(on: database)
        }
    }
    
    func revert(on database: Database) async throws {
        try await User.query(on: database).delete()
    }
}
