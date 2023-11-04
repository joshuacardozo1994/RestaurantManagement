//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor

struct CategoryResponse: Content {
    var id: UUID
    var name: String
    var description: String?
    var type: CategoryType
    var items: [ItemResponse]
}
