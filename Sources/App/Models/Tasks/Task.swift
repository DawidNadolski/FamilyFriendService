//
//  File.swift
//
//
//  Created by Dawid Nadolski on 19/08/2021.
//

import Foundation
import Vapor
import Fluent
import FluentSQLiteDriver

final class Task: Model {
	
	static let schema = "tasks"
	
	@ID
	var id: UUID?
	
	@Field(key: "name")
	var name: String
	
	@Field(key: "xpPoints")
	var xpPoints: Int
	
	@Field(key: "executingMemberId")
	var executingMemberId: UUID
	
	@Field(key: "executingMemberName")
	var executingMemberName: String
	
	@Field(key: "completed")
	var completed: Bool
	
	init() { }
	
	init(id: UUID? = nil, name: String, xpPoints: Int, executingMemberId: UUID, executingMemberName: String) {
		self.id = id
		self.name = name
		self.xpPoints = xpPoints
		self.executingMemberId = executingMemberId
		self.executingMemberName = executingMemberName
		self.completed = false
	}
}

extension Task: Content { }
