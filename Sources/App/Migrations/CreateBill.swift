//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent

struct CreateBill: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Bill.schema)
            .id()
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Bill.schema).delete()
    }
}

