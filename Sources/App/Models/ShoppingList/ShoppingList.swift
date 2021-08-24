//
//  File.swift
//  
//
//  Created by Dawid Nadolski on 22/08/2021.
//

import Foundation
import Vapor
import Fluent
import FluentSQLiteDriver

final class ShoppingList: Model {
	
	static let schema = "shoppingLists"
	
	@ID
	var id: UUID?
	
	@Field(key: "name")
	var name: String
	
	init() { }
	
	init(id: UUID? = nil, name: String) {
		self.id = id
		self.name = name
	}
}

extension ShoppingList: Content { }
