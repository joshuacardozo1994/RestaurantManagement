//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 28/10/23.
//



import Vapor
import Fluent
import JWT

/// `User` represents a user in the system, such as an employee or an admin.
///
/// This class is a model in the context of a database and is used with Fluent in Vapor. It includes user-related information like ``username``, ``passwordHash``, ``email``, and their role in the system. It also conforms to `ModelAuthenticatable` for authentication purposes.
///
/// Properties:
///   - ``id``: UUID? - A unique identifier for the user. Optional, as it may not be set before saving the object to the database.
///   - username: String - The user's username.
///   - type: UserType - The role of the user in the system (e.g., admin, accounting, waiter, chef, banned).
///   - passwordHash: String - A hashed version of the user's password.
///   - email: String - The user's email address.
///   - profilePicture: String? - An optional URL/path to the user's profile picture.
///   - createdAt: Date? - A timestamp for when the user record was created. Automatically set on creation.
///   - updatedAt: Date? - A timestamp for when the user record was last updated. Automatically set on update.
///
/// Initialization:
///   - An empty initializer for Fluent.
///   - An initializer with parameters for manual object creation.
///
/// Authentication:
///   - Implements `ModelAuthenticatable` to provide authentication functionality.
///   - `verify(password:)` - Verifies the given password against the stored hash.
///
/// JWT Support:
///   - ``User/UserJWTPayload``: A struct for generating JWT payloads with user information and expiration claims.
///
/// UserType:
///   - An enum representing the different types of users (roles) in the system.
///
/// Example Usage:
/// ```
/// let newUser = User(username: "johndoe", type: .waiter, passwordHash: hashedPassword, email: "john@example.com")
/// ```
///
/// - Warning: Ensure that the password is properly hashed before storing it in the `passwordHash` field.
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
    
    @Field(key: "verified")
    var verified: Bool

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

    init(id: UUID? = nil, username: String, type: UserType, verified: Bool, passwordHash: String, email: String, profilePicture: String? = nil) {
        self.id = id
        self.username = username
        self.type = type
        self.verified = verified
        self.passwordHash = passwordHash
        self.email = email
        self.profilePicture = profilePicture
    }

    // Method required for `ModelAuthenticatable`
    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.passwordHash)
    }
}
