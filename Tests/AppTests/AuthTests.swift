//
//  File.swift
//  
//
//  Created by Joshua Cardozo on 17/11/23.
//

@testable import App
import XCTVapor

final class AuthTests: XCTestCase {
    
    var app: Application!
    
    override func tearDown() {
       super.tearDown()
        app.shutdown()
        print("Closed")
   }
    
    func setupApp() async throws -> Application {
        let app = Application(.testing)
        try await configure(app)
        return app
    }
    
    func testifAdminIsPresent() async throws {
        try await app = setupApp()
        
        guard let adminUsername = Environment.get("ADMIN_USERNAME"), let adminPassword = Environment.get("ADMIN_PASSWORD") else { throw Abort(.notFound, reason: "not present in ENV") }
        
        let loginRequest = LoginRequest(username: adminUsername, password: adminPassword)
        
        try app.test(.POST, "auth/login") { req in
            try req.content.encode(loginRequest)
            
        } afterResponse: { res in
            let decoder = JSONDecoder()
            let user = try decoder.decode(UserResponse.self, from: res.body)
            XCTAssertEqual(user.type, .admin)
        }
    }
    
    func testIfNewUsersAreUnverified() async throws {
        try await app = setupApp()
        
        let user = UserFactory.create(type: .waiter)
        let userRegistration = UserRegistration(username: user.username, email: user.email, password: String.random(length: 8), type: .waiter)
        
        try app.test(.POST, "auth/register") { req in
            try req.content.encode(userRegistration)
            
        } afterResponse: { res in
            let decoder = JSONDecoder()
            let user = try decoder.decode(UserResponse.self, from: res.body)
            XCTAssertEqual(user.verified, false)
        }
    }
    
    func testInvalidUsername() async throws {
        try await app = setupApp()
        
        let user = UserFactory.create(type: .waiter)
        let userRegistration = UserRegistration(username: "", email: user.email, password: String.random(length: 8), type: .waiter)
        
        try app.test(.POST, "auth/register") { req in
            try req.content.encode(userRegistration)
            
        } afterResponse: { res in
            XCTAssertEqual(res.status, .badRequest)
        }
    }
    
    func testInvalidEmail() async throws {
        try await app = setupApp()
        
        let user1 = UserFactory.create(type: .waiter)
        let userRegistration1 = UserRegistration(username: user1.username, email: String.random(length: 8), password: String.random(length: 8), type: .waiter)
        
        try app.test(.POST, "auth/register") { req in
            try req.content.encode(userRegistration1)
            
        } afterResponse: { res in
            XCTAssertEqual(res.status, .badRequest)
        }
        
        let user2 = UserFactory.create(type: .waiter)
        let userRegistration2 = UserRegistration(username: user2.username, email: "", password: String.random(length: 8), type: .waiter)
        
        try app.test(.POST, "auth/register") { req in
            try req.content.encode(userRegistration2)
            
        } afterResponse: { res in
            XCTAssertEqual(res.status, .badRequest)
        }
    }
    
    func testInvalidPassword() async throws {
        try await app = setupApp()
        
        let user1 = UserFactory.create(type: .waiter)
        let userRegistration1 = UserRegistration(username: user1.username, email: user1.email, password: String.random(length: 7), type: .waiter)
        
        try app.test(.POST, "auth/register") { req in
            try req.content.encode(userRegistration1)
            
        } afterResponse: { res in
            XCTAssertEqual(res.status, .badRequest)
        }
        
        let user2 = UserFactory.create(type: .waiter)
        let userRegistration2 = UserRegistration(username: user2.username, email: user1.email, password: "", type: .waiter)
        
        try app.test(.POST, "auth/register") { req in
            try req.content.encode(userRegistration2)
            
        } afterResponse: { res in
            XCTAssertEqual(res.status, .badRequest)
        }
    }
    
    func testIfDuplicateRegistrationNotAllowed() async throws {
        try await app = setupApp()
        
        let user = UserFactory.create(type: .waiter)
        
        let userRegistration = UserRegistration(username: user.username, email: user.email, password: String.random(length: 8), type: .waiter)
        
        let userRegistrationjsonData = try JSONEncoder().encode(userRegistration)
        
        let _ = try await app.sendRequest(.POST, "auth/register", headers: HTTPHeaders([("Content-Type", "application/json")]), body: ByteBuffer(data: userRegistrationjsonData))

        try app.test(.POST, "auth/register") { req in
            try req.content.encode(userRegistration)
            
        } afterResponse: { res in
            XCTAssertEqual(res.status, .internalServerError)
        }
    }
    
    func testIfAdminCanVerifyNewUser() async throws {
        try await app = setupApp()
        
        let adminToken = try await getAdminToken()
        
        let user = UserFactory.create(type: .waiter)
        let userRegistration = UserRegistration(username: user.username, email: user.email, password: String.random(length: 8), type: .waiter)
        let userRegistrationjsonData = try JSONEncoder().encode(userRegistration)
        let userRegistrationRes = try await app.sendRequest(.POST, "auth/register", headers: HTTPHeaders([("Content-Type", "application/json")]), body: ByteBuffer(data: userRegistrationjsonData))
        let decoder = JSONDecoder()
        let registeredUser = try decoder.decode(UserResponse.self, from: userRegistrationRes.body)
        
        let updatedUserData = UpdateUserRequest(verified: true)
        
        try app.test(.PATCH, "auth/update/\(registeredUser.id)", headers: HTTPHeaders([("Authorization", "Bearer \(adminToken)")])) { req in
            try req.content.encode(updatedUserData)
            
        } afterResponse: { res in
            let decoder = JSONDecoder()
            let user = try decoder.decode(UserResponse.self, from: res.body)
            XCTAssertEqual(user.verified, true)
        }
    }
    
    func testIfNonLoggedInUserCantVerifyNewUser() async throws {
        try await app = setupApp()
        
        let decoder = JSONDecoder()
        let adminToken = try await getAdminToken()
        
        
        let user = UserFactory.create(type: .waiter)
        let userRegistration = UserRegistration(username: user.username, email: user.email, password: String.random(length: 8), type: .waiter)
        let userRegistrationjsonData = try JSONEncoder().encode(userRegistration)
        let userRegistrationRes = try await app.sendRequest(.POST, "auth/register", headers: HTTPHeaders([("Content-Type", "application/json")]), body: ByteBuffer(data: userRegistrationjsonData))
        let registeredUser = try decoder.decode(UserResponse.self, from: userRegistrationRes.body)
        
        let updatedUserData = UpdateUserRequest(verified: true)
        
        try app.test(.PATCH, "auth/update/\(registeredUser.id)", headers: HTTPHeaders([("Content-Type", "application/json")])) { req in
            try req.content.encode(updatedUserData)
            
        } afterResponse: { res in
            XCTAssertEqual(res.status, .unauthorized)
        }
    }
    
    func testIfAdminCanGetAllUsers() async throws {
        try await app = setupApp()
        
        let adminToken = try await getAdminToken()
        
        try app.test(.GET, "auth/users", headers: HTTPHeaders([("Authorization", "Bearer \(adminToken)"), ("Content-Type", "application/json")]), body: nil) { res in
            XCTAssertEqual(res.status, .ok)
            let decoder = JSONDecoder()
            XCTAssertNoThrow(try decoder.decode([UserResponse].self, from: res.body))
        }
    }
    
    func testIfNonAdminCantGetAllUsers() async throws {
        try await app = setupApp()
        
        try app.test(.GET, "auth/users", headers: HTTPHeaders([("Content-Type", "application/json")]), body: nil) { res in
            XCTAssertEqual(res.status, .unauthorized)
        }
    }
    
    func testIncorrectLogin() async throws {
        try await app = setupApp()
        
        let loginRequest = LoginRequest(username: String.random(length: 8), password: String.random(length: 8))
        
        try app.test(.POST, "auth/login") { req in
            try req.content.encode(loginRequest)
        } afterResponse: { res in
            XCTAssertEqual(res.status, .unauthorized)
        }
    }
    
    func testUnauthorizedAccess() async throws {
        try await app = setupApp()

        try app.test(.GET, "protected/dashboard", afterResponse: { res in
            XCTAssertEqual(res.status, .unauthorized)
            let decoder = JSONDecoder()
            let error = try decoder.decode(ErrorResponse.self, from: res.body)
            XCTAssertEqual(error.reason, "Unauthorized")
        })
    }
}

extension AuthTests {
    func getAdminToken() async throws -> String {
        guard let adminUsername = Environment.get("ADMIN_USERNAME"), let adminPassword = Environment.get("ADMIN_PASSWORD") else { throw Abort(.notFound, reason: "not present in ENV") }
        let adminLoginRequest = LoginRequest(username: adminUsername, password: adminPassword)
        let adminLoginjsonData = try JSONEncoder().encode(adminLoginRequest)
        let adminLoginRes = try await app.sendRequest(.POST, "auth/login", headers: HTTPHeaders([("Content-Type", "application/json")]), body: ByteBuffer(data: adminLoginjsonData))
        let decoder = JSONDecoder()
        let adminUserData = try decoder.decode(UserResponse.self, from: adminLoginRes.body)
        guard let adminToken = adminUserData.token else { throw Abort(.unauthorized) }
        return adminToken
    }
}
