//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent
import Vapor

/// `Bill` represents a bill or invoice associated with a table in a restaurant or similar setting.
///
/// This class is a model used for managing bills in a database using Fluent in Vapor. It includes details about the bill's status, associated table, and related orders. The status of the bill is managed through an enumeration to represent different stages like open, asked, and paid.
///
/// Properties:
///   - id: UUID? - A unique identifier for the bill. Optional, as it may not be set before saving the object to the database.
///   - table: Table - A parent relationship to the ``Table`` model, representing the table associated with the bill.
///   - orders: [Order] - A children relationship indicating the orders included in this bill.
///   - status: Status - The current status of the bill, represented by the ``Bill/Status-swift.enum`` enum.
///   - createdAt: Date? - A timestamp for when the bill record was created. Automatically set on creation.
///   - updatedAt: Date? - A timestamp for when the bill record was last updated. Automatically set on update.
///
/// Initialization:
///   - An empty initializer for Fluent.
///   - An initializer with parameters for manual object creation, allowing the specification of the bill's properties, including its associated table.
///
/// Status Enumeration:
///   - Defines the possible states of a bill: ``Bill/Status-swift.enum/open``, ``Bill/Status-swift.enum/asked``, and ``Bill/Status-swift.enum/paid``.
///
/// Example Usage:
/// ```
/// let newBill = Bill(tableID: someTableID, status: .open)
/// ```
///
/// - Note: The relationships to `Table` and `Order` are essential and must be properly managed to ensure data consistency.
final class Bill: Model, Content {
    static let schema = "bills"
    
    // Define an enumeration for the bill status
    enum Status: String, Codable {
        case open = "open"
        case asked = "asked"
        case paid = "paid"
    }
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "table_id")
    var table: Table
    
    @Children(for: \.$bill)
    var orders: [Order]
    
    // Add a status field with the enum type
    @Field(key: "status")
    var status: Status
    
    // When this Bill was created.
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    // When this Bill was last updated.
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, tableID: Table.IDValue, status: Status = .open) {
        self.id = id
        self.$table.id = tableID
        self.status = status
    }
}


