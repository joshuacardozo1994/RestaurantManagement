//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 12/11/23.
//

import Vapor
import Foundation
import Fakery

struct UserFactory {
    static func create(username: String? = nil, type: User.UserType, verified: Bool = false, email: String? = nil) -> User {
        let faker = Faker()

        let newUser = User(
            username: username ?? faker.internet.username(),
            type: type,
            verified: verified, 
            passwordHash: try! Bcrypt.hash(username ?? faker.internet.username()),
            email: faker.internet.email(),
            profilePicture: faker.internet.image()
        )
        
        return newUser
    }
    
    static func generateTokenForUser(user: User) {
        
    }
}
