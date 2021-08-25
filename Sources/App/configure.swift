import Fluent
import FluentSQLiteDriver
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
					
	app.databases.use(
		.postgres(
			hostname: Environment.get("DATABASE_HOST") ?? "localhost",
			username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
			password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
			database: Environment.get("DATABASE_NAME") ?? "vapor_database"
		),
		as: .psql
	)
	
	app.logger.logLevel = .debug
	
	app.migrations.add(CreateMember())
	app.migrations.add(CreateTask())
	app.migrations.add(CreateShoppingList())
	app.migrations.add(CreateShoppingListComponent())
		
	try app.autoMigrate().wait()

    try routes(app)
}
