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
}
