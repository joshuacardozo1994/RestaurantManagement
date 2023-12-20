//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/12/23.
//

import Fluent
import Vapor

struct ServingSizeSeeder: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await MenuHelper.addServingSizes(database)
    }
    
    func revert(on database: Database) async throws {
        try await ServingSize.query(on: database).delete()
    }
}
