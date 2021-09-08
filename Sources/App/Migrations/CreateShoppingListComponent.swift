//
//  File.swift
//
//
//  Created by Dawid Nadolski on 23/08/2021.
//

import Fluent

final class CreateShoppingListComponent: Migration {
	
	func prepare(on database: Database) -> EventLoopFuture<Void> {
		database.schema("shoppingListComponents")
			.id()
			.field("listId", .uuid, .required, .references("shoppingLists", "id"))
			.field("name", .string, .required)
			.create()
	}
	
	func revert(on database: Database) -> EventLoopFuture<Void> {
		database.schema("shoppingListComponents").delete()
	}
}
