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
	
	@Parent(key: "familyId")
	var family: Family
	
	@Field(key: "name")
	var name: String
	
	init() { }
	
	init(id: UUID? = nil, familyId: Family.IDValue, name: String) {
		self.id = id
		self.$family.id = familyId
		self.name = name
	}
}

extension ShoppingList: Content { }
