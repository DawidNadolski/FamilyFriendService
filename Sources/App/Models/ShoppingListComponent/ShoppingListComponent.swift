//
//  File.swift
//
//
//  Created by Dawid Nadolski on 23/08/2021.
//

import Foundation
import Vapor
import Fluent
import FluentSQLiteDriver

final class ShoppingListComponent: Model {
	
	static let schema = "shoppingListComponents"
	
	@ID
	var id: UUID?
	
	@Field(key: "listId")
	var listId: UUID
	
	@Field(key: "name")
	var name: String
	
	init() { }
	
	init(id: UUID? = nil, listId: UUID, name: String) {
		self.id = id
		self.listId = listId
		self.name = name
	}
}

extension ShoppingListComponent: Content { }
