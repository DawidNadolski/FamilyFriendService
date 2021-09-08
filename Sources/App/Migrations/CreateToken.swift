//
//  CreateTokens.swift
//  
//
//  Created by Dawid Nadolski on 27/08/2021.
//

import Fluent

struct CreateToken: Migration {
	func prepare(on database: Database) -> EventLoopFuture<Void> {
		database.schema(Token.schema)
			.field("id", .uuid, .identifier(auto: true))
			.field("userId", .uuid, .references("users", "id"))
			.field("value", .string, .required)
			.unique(on: "value")
			.field("source", .int, .required)
			.field("createdAt", .datetime, .required)
			.field("expiresAt", .datetime)
			.create()
	}
	
	func revert(on database: Database) -> EventLoopFuture<Void> {
		database.schema(Token.schema).delete()
	}
}
