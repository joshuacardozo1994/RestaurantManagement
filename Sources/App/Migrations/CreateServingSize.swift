//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/12/23.
//

import Fluent

struct CreateServingSize: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(ServingSize.schema)
            .id()
            .field("name", .string, .required)
            .field("description", .string, .required)
            .field("expression", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(ServingSize.schema).delete()
    }
}
