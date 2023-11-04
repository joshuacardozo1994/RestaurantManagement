//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor
import Fluent

final class Category: Model, Content {
    static let schema = "categories"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "position")
    var position: Int
    
    @Field(key: "description")
    var description: String?
    
    @Enum(key: "type")
    var type: CategoryType
    
    @Children(for: \.$category)
    var items: [Item]
    
    init() {}
    
    init(id: UUID? = nil, name: String, position: Int, description: String?, type: CategoryType) {
        self.id = id
        self.name = name
        self.position = position
        self.description = description
        self.type = type
    }
}

enum CategoryType: String, Codable {
    case food
    case drinks
}

