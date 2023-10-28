//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor

struct MenuResponse: Content {
    var id: UUID
    var name: String
    var description: String?
    var price: Double
    var imageUrl: String?
}
