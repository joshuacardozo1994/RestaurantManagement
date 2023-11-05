//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/11/23.
//

import Fluent
import Vapor

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

    init() { }

    init(id: UUID? = nil, number: Int, currentStaffID: User.IDValue? = nil) {
        self.id = id
        self.number = number
        self.$currentStaff.id = currentStaffID
    }
}

