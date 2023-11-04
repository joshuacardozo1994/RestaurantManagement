//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent
import Vapor

final class Order: Model, Content {
    static let schema = "orders"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "quantity")
    var quantity: Int
    
    // Assuming Item is another Model linked to this Order
    @Parent(key: "item_id")
    var item: Item
    
    @Parent(key: "bill_id")
    var bill: Bill

    init() { }

    init(id: UUID? = nil, quantity: Int, itemId: UUID, billId: UUID) {
        self.id = id
        self.quantity = quantity
        self.$item.id = itemId
        self.$bill.id = billId
    }
}

