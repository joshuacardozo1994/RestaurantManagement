import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor
import JWT

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
//    app.middleware.use(JWTAuthMiddleware())
    app.http.server.configuration.hostname = "0.0.0.0"
//    app.http.server.configuration.hostname = "dev.local"
    app.jwt.signers.use(.hs256(key: "foo"), kid: "a")
    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)

    // register routes
    try routes(app)
    
    
    // migrations
    app.migrations.add(CreateUser())
    app.migrations.add(CreateCategory())
    app.migrations.add(CreateItem())
    app.migrations.add(CreateTable())
    app.migrations.add(CreateBill())
    app.migrations.add(CreateOrder())
    
    
    // seeders
    app.migrations.add(UserSeeder())
    app.migrations.add(MenuSeeder())
    app.migrations.add(TableSeeder())
    
    try app.autoMigrate().wait()

}
