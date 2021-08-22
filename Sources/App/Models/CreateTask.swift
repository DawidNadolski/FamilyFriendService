//
//  CreateTask.swift
//
//
//  Created by Dawid Nadolski on 20/08/2021.
//

import Fluent

struct CreateTask: Migration {
	
	func prepare(on database: Database) -> EventLoopFuture<Void> {
		database.schema("tasks")
			.id()
			.field("name", .string, .required)
			.field("xpPoints", .int, .required)
			.field("executingMemberID", .int)
			.field("completed", .bool)
			.create()
	}
	
	func revert(on database: Database) -> EventLoopFuture<Void> {
		database.schema("tasks").delete()
	}
}
