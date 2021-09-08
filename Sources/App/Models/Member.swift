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

extension Member: Content { }
