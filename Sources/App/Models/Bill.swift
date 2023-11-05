//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent
import Vapor

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

    init() { }

    init(id: UUID? = nil, tableID: Table.IDValue, status: Status = .open) {
        self.id = id
        self.$table.id = tableID
        self.status = status
    }
}


