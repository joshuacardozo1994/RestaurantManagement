@testable import App
import XCTVapor

struct ErrorResponse: Decodable {
    let error: Bool
    let reason: String
}

final class AppTests: XCTestCase {
    
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
    
    func testroot() async throws {
        try await app = setupApp()

        try app.test(.GET, "/", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
        })
    }
    
    func testGetItems() async throws {
        try await app = setupApp()
        
        guard let adminUsername = Environment.get("ADMIN_USERNAME"), let adminPassword = Environment.get("ADMIN_PASSWORD") else { throw Abort(.notFound, reason: "not present in ENV") }
        
        let loginRequest = LoginRequest(username: adminUsername, password: adminPassword)
        
        let jsonData = try JSONEncoder().encode(loginRequest)
        
        let res = try await app.sendRequest(.POST, "auth/login", headers: HTTPHeaders([("Content-Type", "application/json")]), body: ByteBuffer(data: jsonData))
        let decoder = JSONDecoder()
        let userData = try decoder.decode(UserResponse.self, from: res.body)
        guard let token = userData.token else { throw Abort(.unauthorized) }
        try app.test(.GET, "items", headers: HTTPHeaders([("Authorization", "Bearer \(token)"), ("Content-Type", "application/json")]), body: nil) { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertNoThrow(try decoder.decode([ItemResponse].self, from: res.body))
        }
        
    }
}
