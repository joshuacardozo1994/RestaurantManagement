//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor

struct ItemResponse: Content {
    var id: UUID
    var name: String
    var subtext: String?
    var description: String?
    var price: Double
    var imageUrl: String?
    var enabled: Bool
}
