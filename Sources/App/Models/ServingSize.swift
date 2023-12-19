//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 04/12/23.
//

import Vapor
import Fluent

final class ServingSize: Model, Content {
    static let schema = "serving_sizes"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "description")
    var description: String
    
    @Field(key: "expression")
    var expression: String

    init() {}
    
    init(id: UUID? = nil, name: String, description: String, expression: String) {
        self.id = id
        self.name = name
        self.description = description
        self.expression = expression
    }
}
