//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor

struct UserResponse: Content {
    var id: UUID
    var username: String
    var email: String
    var profilePicture: String?
    var token: String
}
