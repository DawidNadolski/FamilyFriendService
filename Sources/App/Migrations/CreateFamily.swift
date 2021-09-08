//
//  File.swift
//  
//
//  Created by Dawid Nadolski on 01/09/2021.
//

import Fluent

struct CreateFamily: Migration {
	
	func prepare(on database: Database) -> EventLoopFuture<Void> {
		database.schema("families")
			.id()
			.field("name", .string, .required)
			.field("password", .string, .required)
			.create()
	}
	
	func revert(on database: Database) -> EventLoopFuture<Void> {
		database.schema("families").delete()
	}
}
