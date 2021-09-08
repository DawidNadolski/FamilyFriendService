import Fluent
import FluentSQLiteDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
	
	app.databases.use(.sqlite(.file("FamilyFriend.sqlite")), as: .sqlite)
		
	app.logger.logLevel = .debug
	
	app.migrations.add(CreateFamily())
	app.migrations.add(CreateToken())
	app.migrations.add(CreateUser())
	app.migrations.add(CreateMember())
	app.migrations.add(CreateTask())
	app.migrations.add(CreateShoppingList())
	app.migrations.add(CreateShoppingListComponent())
		
	try app.autoMigrate().wait()

    try routes(app)
}
