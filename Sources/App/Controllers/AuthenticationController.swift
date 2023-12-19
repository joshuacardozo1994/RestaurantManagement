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
        authRoutes.post("register", use: register)
        
        
        let protectedUsersRoutes = authRoutes.grouped(JWTAuthMiddleware(authorizedUserTypes: [.admin]))
        protectedUsersRoutes.patch("update", ":userID", use: updateUser)
        protectedUsersRoutes.get("users", use: getAllUsers)
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
        
        let token = try user.getToken(req: req, password: loginRequest.password)
        
        return try user.convertToUserResponse(token: token)
    }

    func register(_ req: Request) async throws -> UserResponse {
        try UserRegistration.validate(content: req)
        let registration = try req.content.decode(UserRegistration.self)

        let hashedPassword = try Bcrypt.hash(registration.password)
        
        let user = User(username: registration.username, type: registration.type, verified: false, passwordHash: hashedPassword, email: registration.email)

        try await user.save(on: req.db)
        return try user.convertToUserResponse(token: nil)
    }
    
    func getAllUsers(_ req: Request) async throws -> [UserResponse] {
        let users = try await User.query(on: req.db).all()
        return try users.map { try $0.convertToUserResponse(token: nil) }
    }
    
    func updateUser(_ req: Request) async throws -> UserResponse {
        let updateUserData = try req.content.decode(UpdateUserRequest.self)
        guard let user = try await User.find(req.parameters.get("userID"), on: req.db) else {
            throw Abort(.notFound)
        }
        let updatedUser = user
        
        if let username = updateUserData.username {
            updatedUser.username = username
        }
        if let type = updateUserData.type {
            updatedUser.type = type
        }
        if let email = updateUserData.email {
            updatedUser.email = email
        }
        if let profilePicture = updateUserData.profilePicture {
            updatedUser.profilePicture = profilePicture
        }
        if let verified = updateUserData.verified {
            updatedUser.verified = verified
        }
        try await updatedUser.save(on: req.db)
        return try user.convertToUserResponse(token: nil)
    }
}

