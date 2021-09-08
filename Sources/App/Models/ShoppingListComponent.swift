//
//  File.swift
//
//
//  Created by Dawid Nadolski on 23/08/2021.
//

import Vapor
import Fluent

final class ShoppingListComponent: Model {
	
	static let schema = "shoppingListComponents"
	
	@ID
	var id: UUID?
	
	@Parent(key: "listId")
	var shoppingList: ShoppingList
	
	@Field(key: "name")
	var name: String
	
	init() { }
	
	init(id: UUID? = nil, listId: ShoppingList.IDValue, name: String) {
		self.id = id
		self.$shoppingList.id = listId
		self.name = name
	}
}

extension ShoppingListComponent: Content { }
