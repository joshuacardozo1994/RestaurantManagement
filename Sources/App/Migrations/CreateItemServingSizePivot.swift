//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/12/23.
//

import Fluent

struct CreateItemServingSizePivot: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(ItemServingSizePivot.schema)
            .id()
            .field("item_id", .uuid, .references("items", "id", onDelete: .cascade))
            .field("serving_size_id", .uuid, .references("serving_sizes", "id", onDelete: .cascade))
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(ItemServingSizePivot.schema).delete()
    }
}

