//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 05/11/23.
//

import Fluent
import Vapor

struct TableSeeder: AsyncMigration {
    func prepare(on database: Database) async throws {
        let tables = (1...12).map { Table(number: $0) }
        
        for table in tables {
            try await table.create(on: database)
        }
    }
    
    func revert(on database: Database) async throws {
        try await Table.query(on: database).delete()
    }
}
