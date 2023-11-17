@testable import App
import XCTVapor

struct ErrorResponse: Decodable {
    let error: Bool
    let reason: String
}

final class AppTests: XCTestCase {
    
    var app: Application!
    
    override func setUp() {
        super.setUp()
        app = Application(.testing)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func setupApp() async throws -> Application {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        return app
    }
    
    func testroot() async throws {
        let app = try await setupApp()

        try app.test(.GET, "/", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
        })
    }
    
    func testAdmin() async throws {
        let app = try await setupApp()
        
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
    
//case admin
//case accounting
//case waiter
//case chef
    func testUnverifiedUser() async throws {
        
    }
    
    func testIncorrectLogin() async throws {
        let app = try await setupApp()
        
        let loginRequest = LoginRequest(username: "qwert", password: "qwerty")
        
        try app.test(.POST, "auth/login") { req in
            try req.content.encode(loginRequest)
        } afterResponse: { res in
            XCTAssertEqual(res.status, .unauthorized)
        }
    }
    
    func testUnauthorizedAccess() async throws {
        let app = try await setupApp()

        try app.test(.GET, "protected/dashboard", afterResponse: { res in
            XCTAssertEqual(res.status, .unauthorized)
            let decoder = JSONDecoder()
            let error = try decoder.decode(ErrorResponse.self, from: res.body)
            XCTAssertEqual(error.reason, "Unauthorized")
        })
    }
    
    func testGetItems() async throws {
        let app = try await setupApp()
        
        guard let adminUsername = Environment.get("ADMIN_USERNAME"), let adminPassword = Environment.get("ADMIN_PASSWORD") else { throw Abort(.notFound, reason: "not present in ENV") }
        
        let loginRequest = LoginRequest(username: adminUsername, password: adminPassword)
        
        let jsonData = try JSONEncoder().encode(loginRequest)
        
        let res = try await app.sendRequest(.POST, "auth/login", headers: HTTPHeaders([("Content-Type", "application/json")]), body: ByteBuffer(data: jsonData))
        let decoder = JSONDecoder()
        let userData = try decoder.decode(UserResponse.self, from: res.body)
        
        try app.test(.GET, "items", headers: HTTPHeaders([("Authorization", "Bearer \(userData.token)"), ("Content-Type", "application/json")]), body: nil) { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertNoThrow(try decoder.decode([ItemResponse].self, from: res.body))
        }
        
    }
}
