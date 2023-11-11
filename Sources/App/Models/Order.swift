//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent
import Vapor

/// `Order` represents an individual order in the system.
///
/// This class is a model for managing orders in a database using Fluent in Vapor. It encapsulates the details of an order, including the quantity of the ordered item, and references to the associated item and bill.
///
/// Properties:
///   - id: UUID? - A unique identifier for the order. Optional, as it may not be set before the object is saved to the database.
///   - quantity: Int - The quantity of the item ordered.
///   - item: Item - A parent relationship to the `Item` model, representing the item being ordered.
///   - bill: Bill - A parent relationship to the `Bill` model, representing the bill associated with the order.
///   - createdAt: Date? - A timestamp indicating when this order was created. Automatically set on creation.
///   - updatedAt: Date? - A timestamp indicating when this order was last updated. Automatically set on update.
///
/// Initialization:
///   - An empty initializer for Fluent.
///   - An initializer with `id`, `quantity`, `itemId`, and `billId` for manual object creation, linking the order to specific items and bills.
///
/// Example Usage:
/// ```
/// let order = Order(quantity: 3, itemId: someItemID, billId: someBillID)
/// ```
///
/// - Note: The relationships to `Item` and `Bill` are critical and require valid existing IDs in the database for those models.
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
    
    // When this Order was created.
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    // When this Order was last updated.
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, quantity: Int, itemId: UUID, billId: UUID) {
        self.id = id
        self.quantity = quantity
        self.$item.id = itemId
        self.$bill.id = billId
    }
}

