//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor
import Fluent
import JWT
import JWTKit

struct AuthenticationController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let authRoutes = routes.grouped("auth")
        authRoutes.post("login", use: login)
//        authRoutes.post("register", use: register)
        // Add more authentication routes here if needed
    }

    func login(_ req: Request) async throws -> UserResponse {
        let loginRequest = try req.content.decode(LoginRequest.self)
        
        guard let user = try await User.query(on: req.db)
            .filter(\.$username == loginRequest.username)
            .first()
        else {
            throw Abort(.unauthorized)
        }
        
        // Verify password
        if try !Bcrypt.verify(loginRequest.password, created: user.passwordHash) {
            throw Abort(.unauthorized)
        }
        
        // Create JWT payload
        let payload = User.UserJWTPayload(user: user)
            
        let token = try req.jwt.sign(payload)
        
        return UserResponse(id: try user.requireID(), username: user.username, email: user.email, profilePicture: user.profilePicture, token: token)
    }

//    func register(_ req: Request) async throws -> User {
//        try UserRegistration.validate(content: req)
//        let registration = try req.content.decode(UserRegistration.self)
//
//        let hashedPassword = try Bcrypt.hash(registration.password)
//        let user = User(username: registration.username,
//                        passwordHash: hashedPassword,
//                        email: registration.email)
//
//        try await user.save(on: req.db)
//        return user
//    }
}

