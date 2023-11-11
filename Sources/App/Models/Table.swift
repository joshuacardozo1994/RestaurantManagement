//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent
import Vapor


/// `Table` represents a table in a restaurant or similar setting.
///
/// This class is a model in the context of a database, specifically designed to be used with Fluent in Vapor.
/// It holds information about a table, including its unique identifier, number, the current staff member assigned to it, an associated bill, and timestamps for creation and update.
///
/// - Note: This model assumes the use of a UUID as the primary key.
///
/// Properties:
///   - id: UUID? - A unique identifier for the table. Optional as it may not be set before the object is saved to the database.
///   - number: Int - The number assigned to the table.
///   - currentStaff: User? - An optional reference to the `User` (staff member) currently assigned to this table.
///                          It is an optional parent relationship, indicating that a table may not always have a staff member assigned.
///   - bill: Bill? - An optional child relationship to a `Bill`. It represents the bill associated with this table, if any.
///   - createdAt: Date? - A timestamp indicating when this table record was created. Automatically set on creation.
///   - updatedAt: Date? - A timestamp indicating the last time this table record was updated. Automatically set on update.
///
/// Initialization:
///   The class provides two initializers:
///   - An empty initializer for Fluent.
///   - An initializer with `id`, `number`, and `currentStaffID` for manual object creation.
///
/// Example Usage:
/// ```
/// let table = Table(number: 5, currentStaffID: someUserID)
/// ```
///
/// - Warning: Modifying the relationships (`currentStaff` and `bill`) directly might lead to inconsistencies in the database unless properly managed.
///
final class Table: Model, Content {
    static let schema = "tables"
    
    @ID(key: .id)
    var id: UUID?
    
    
    @Field(key: "number")
    var number: Int
    
    // Optional if a table may not always have a staff member assigned.
    @OptionalParent(key: "current_staff_id")
    var currentStaff: User?
    
    // Optional child relationship to Bill
    @OptionalChild(for: \.$table)
    var bill: Bill?
    
    // When this Table was created.
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    // When this Table was last updated.
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() { }

    init(id: UUID? = nil, number: Int, currentStaffID: UUID? = nil) {
        self.id = id
        self.number = number
        self.$currentStaff.id = currentStaffID
    }
}

