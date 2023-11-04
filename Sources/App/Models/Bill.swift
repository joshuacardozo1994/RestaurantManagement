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
    
    @ID(key: .id)
    var id: UUID?
    
    @Children(for: \.$bill)
    var orders: [Order]

    init() { }

    init(id: UUID? = nil) {
        self.id = id
    }
}
