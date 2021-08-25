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
	
	@Field(key: "assignedMemberId")
	var assignedMemberId: UUID
	
	@Field(key: "assignedMemberName")
	var assignedMemberName: String
	
	@Field(key: "completed")
	var completed: Bool
	
	init() { }
	
	init(id: UUID? = nil, name: String, xpPoints: Int, assignedMemberId: UUID, assignedMemberName: String) {
		self.id = id
		self.name = name
		self.xpPoints = xpPoints
		self.assignedMemberId = assignedMemberId
		self.assignedMemberName = assignedMemberName
		self.completed = false
	}
}

extension Task: Content { }
