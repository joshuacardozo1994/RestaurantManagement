//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//

import Vapor
import JWT

import Vapor
import JWT

struct JWTAuthMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        guard let token = request.headers.bearerAuthorization?.token else {
            throw Abort(.unauthorized)
        }
        
        do {
            let payload = try request.jwt.verify(token, as: User.UserJWTPayload.self)
            
            // Fetch the user based on the ID from the payload
            if let user = try await User.find(payload.user.requireID(), on: request.db) {
                request.auth.login(user) // Log in the user
            } else {
                throw Abort(.unauthorized)
            }
        } catch {
            throw Abort(.unauthorized)
        }
        
        return try await next.respond(to: request)
    }
}

