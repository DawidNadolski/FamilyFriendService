import Fluent
import Vapor

func routes(_ app: Application) throws {
	app.get { req in
		return "Hello world!"
	}
	
	app.get("tasks") { req -> EventLoopFuture<[Task]> in
		return req.db.query(Task.self).all()
	}
	
	app.post("task") { req -> EventLoopFuture<Task> in
		let task = try req.content.decode(Task.self)
		
		return task.save(on: req.db).map { task }
	}
	
	app.get("shoppingLists") { req -> EventLoopFuture<[ShoppingList]> in
		return req.db.query(ShoppingList.self).all()
	}
	
	app.post("shoppingList") { req -> EventLoopFuture<ShoppingList> in
		let shoppingList = try req.content.decode(ShoppingList.self)
		
		return shoppingList.save(on: req.db).map { shoppingList }
	}
	
	app.post("deleteShoppingList") { req -> EventLoopFuture<ShoppingList> in
		let shoppingList = try req.content.decode(ShoppingList.self)
		
		// TODO: Consider removing associated components
		
		return shoppingList.delete(on: req.db).map { shoppingList }
	}
	
	app.get("shoppingListComponents") { req -> EventLoopFuture<[ShoppingListComponent]> in
		return req.db.query(ShoppingListComponent.self).all()
	}
	
	app.post("shoppingListComponent") { req -> EventLoopFuture<ShoppingListComponent> in
		let component = try req.content.decode(ShoppingListComponent.self)
		
		return component.save(on: req.db).map { component }
	}
	
	app.post("deleteShoppingListComponent") { req -> EventLoopFuture<ShoppingListComponent> in
		let component = try req.content.decode(ShoppingListComponent.self)
		
		return component.delete(on: req.db).map { component }
	}
}
