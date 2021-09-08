import Fluent
import Vapor

func routes(_ app: Application) throws {
	try app.register(collection: UserController())
	
	app.get { req in
		return "Hello world!"
	}
	
	app.get("families") { req -> EventLoopFuture<[Family]> in
		return req.db.query(Family.self).all()
	}
	
	app.post("family") { req -> EventLoopFuture<Family> in
		let family = try req.content.decode(Family.self)
		
		return family.save(on: req.db).map { family }
	}
	
	app.get("members") { req -> EventLoopFuture<[Member]> in
		return req.db.query(Member.self).all()
	}
	
	app.post("member") { req -> EventLoopFuture<Member> in
		let member = try req.content.decode(Member.self)
		
		return member.save(on: req.db).map { member }
	}
	
	app.post("deleteMember") { req -> EventLoopFuture<Member> in
		let member = try req.content.decode(Member.self)
		
		return member.delete(on: req.db).map { member }
	}
	
	app.get("tasks") { req -> EventLoopFuture<[Task]> in
		Task.query(on: req.db).all()
	}
	
	app.post("task") { req -> EventLoopFuture<Task> in
		let task = try req.content.decode(Task.self)
		
		return task.save(on: req.db).map { task }
	}
	
	app.post("deleteTask") { req -> EventLoopFuture<Task> in
		let task = try req.content.decode(Task.self)
		
		return task.delete(on: req.db).map { task }
	}
	
	app.post("completeTask") { req -> EventLoopFuture<Task> in
		let task = try req.content.decode(Task.self)
		
		task.completed = true
		
		return Task.query(on: req.db)
			.filter(\.$id == task.id!)
			.set(\.$completed, to: true)
			.update()
			.map { task }
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
