//
//  File.swift
//  
//
//  Created by Dawid Nadolski on 22/08/2021.
//

import Fluent

final class CreateShoppingList: Migration {
	
	func prepare(on database: Database) -> EventLoopFuture<Void> {
		database.schema("shoppingLists")
			.id()
			.field("name", .string, .required)
			.create()
	}
	
	func revert(on database: Database) -> EventLoopFuture<Void> {
		database.schema("shoppingLists").delete()
	}
}
