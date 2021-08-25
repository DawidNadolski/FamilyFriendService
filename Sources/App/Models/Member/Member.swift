//
//  File.swift
//  
//
//  Created by Dawid Nadolski on 25/08/2021.
//

import Vapor
import Fluent

final class Member: Model {
		
	static let schema = "members"
	
	@ID
	var id: UUID?
	
	@Field(key: "familyId")
	var familyId: UUID
	
	@Field(key: "name")
	var name: String
	
	init() { }
	
	init(id: UUID? = nil, familyId: UUID, name: String) {
		self.id = id
		self.familyId = familyId
		self.name = name
	}
}

extension Member: Content { }
