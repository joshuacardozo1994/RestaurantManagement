//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor
import Fluent

final class Menu: Model, Content {
    static let schema = "menus"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "position")
    var position: Int
    
    @Field(key: "description")
    var description: String?
    
    @Field(key: "price")
    var price: Double
    
    @Field(key: "image_url")
    var imageUrl: String?
    
    @Field(key: "enabled")
    var enabled: Bool
    
    @Parent(key: "category_id")
    var category: Category
    
    init() {}
    
    init(id: UUID? = nil, name: String, position: Int, description: String?, price: Double, imageUrl: String, enabled: Bool, categoryId: UUID) {
        self.id = id
        self.name = name
        self.position = position
        self.description = description
        self.price = price
        self.imageUrl = imageUrl
        self.enabled = enabled
        self.$category.id = categoryId
    }
}

