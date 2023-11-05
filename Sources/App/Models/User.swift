//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//



import Vapor
import Fluent
import JWT

final class User: Model, Content, ModelAuthenticatable {
    // Define the table name if different from the default
    static let schema = "users"

    // ID field
    @ID(key: .id)
    var id: UUID?

    // Other fields
    @Field(key: "username")
    var username: String
    
    // User type: Admin, Accounting, Waiter
    @Enum(key: "type")
    var type: UserType

    @Field(key: "password_hash")
    var passwordHash: String

    @Field(key: "email")
    var email: String

    // Optional fields can be marked with `@OptionalField`
    @OptionalField(key: "profile_picture")
    var profilePicture: String?

    // Timestamp fields for created and updated times
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    // Required by ModelAuthenticatable
    static let usernameKey = \User.$username
    static let passwordHashKey = \User.$passwordHash

    // Initialize
    init() { }

    init(id: UUID? = nil, username: String, type: UserType, passwordHash: String, email: String, profilePicture: String? = nil) {
        self.id = id
        self.username = username
        self.type = type
        self.passwordHash = passwordHash
        self.email = email
        self.profilePicture = profilePicture
    }

    // Method required for `ModelAuthenticatable`
    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.passwordHash)
    }
    
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
    }
}
