//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/12/23.
//

import Fluent
import Vapor

final class ItemServingSizePivot: Model, Content {
    static let schema = "item_serving_size_pivot"

    @ID
    var id: UUID?

    @Parent(key: "item_id")
    var item: Item

    @Parent(key: "serving_size_id")
    var servingSize: ServingSize

    init() {}

    init(id: UUID? = nil, itemID: UUID, servingSizeID: UUID) throws {
        self.id = id
        self.$item.id = itemID
        self.$servingSize.id = servingSizeID
    }
}
