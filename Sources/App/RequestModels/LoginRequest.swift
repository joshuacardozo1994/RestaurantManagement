//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor

struct LoginRequest: Content {
    let username: String
    let password: String
}
