//
//  File.swift
//  
//
//  Created by Dawid Nadolski on 25/08/2021.
//

import Fluent

struct CreateMember: Migration {
	
	func prepare(on database: Database) -> EventLoopFuture<Void> {
		database.schema("members")
			.id()
			.field("familyId", .uuid, .required)
			.field("name", .string, .required)
			.create()
	}
	
	func revert(on database: Database) -> EventLoopFuture<Void> {
		database.schema("members").delete()
	}
}
