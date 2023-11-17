//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 17/11/23.
//

import Vapor

struct UpdateUserRequest: Content {
    var username: String?
    var type: User.UserType?
    var email: String?
    var profilePicture: String?
    var verified: Bool?
}
