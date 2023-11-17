//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 12/11/23.
//

import Vapor
import Foundation
import JWTKit

extension User {
    // JWT payload
    struct UserJWTPayload: JWTPayload {
        var user: User
        var exp: ExpirationClaim
        
        init(user: User) {
            self.user = user
            self.exp = ExpirationClaim(value: Date().addingTimeInterval(60 * 60 * 24 * 180)) // 180 days expiration
        }
        
        func verify(using signer: JWTSigner) throws {
            try self.exp.verifyNotExpired()
        }
    }
    
    enum UserType: String, Codable {
        case admin
        case accounting
        case waiter
        case chef
        case banned
    }
}

extension Array where Element == User.UserType {
    static var validUsers: [User.UserType] {
        return [.admin, .accounting, .waiter, .chef]
    }
    
    static var orderPlacingUserTypes: [User.UserType] {
        return [.admin, .waiter, .chef]
    }
}

extension User {
    func getToken(req: Request, password: String) throws -> String {
        // Verify password
        if try !Bcrypt.verify(password, created: self.passwordHash) {
            throw Abort(.unauthorized)
        }
        
        // Create JWT payload
        let payload = User.UserJWTPayload(user: self)
        
        let token = try req.jwt.sign(payload)
        
        return token
    }
}

extension User {
    func convertToUserResponse(token: String?) throws -> UserResponse {
        UserResponse(id: try self.requireID(), username: self.username, type: self.type, email: self.email, profilePicture: self.profilePicture, token: token, verified: self.verified)
    }
}
