//
//  File.swift
//  
//
//  Created by Dawid Nadolski on 01/09/2021.
//

import Vapor
import Fluent

final class Family: Model {
		
	static let schema = "families"
	
	@ID
	var id: UUID?
	
	@Field(key: "name")
	var name: String
	
	@Field(key: "password")
	var password: String
	
	init() { }
	
	init(id: UUID? = nil, name: String, password: String) {
		self.id = id
		self.name = name
		self.password = password
	}
}

extension Family: Content { }
