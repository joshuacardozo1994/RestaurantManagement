//
//  File.swift
//
//
//  Created by Joshua Cardozo on 19/12/23.
//

import Foundation
import Vapor

struct ServingSizeResponse: Content {
    let id: UUID
    let name: String
    let description: String
    let expression: String
    let shouldDisplay: Bool
}
