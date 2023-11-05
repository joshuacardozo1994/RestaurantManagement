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
        let tables = [
            Table(number: 1),
            Table(number: 2),
            Table(number: 3),
            Table(number: 4),
            Table(number: 5),
            Table(number: 6),
            Table(number: 7),
            Table(number: 8),
            Table(number: 9),
            Table(number: 10),
            Table(number: 11),
            Table(number: 12)
        ]
        
        for table in tables {
            try await table.create(on: database)
        }
    }
    
    func revert(on database: Database) async throws {
        try await Table.query(on: database).delete()
    }
}
