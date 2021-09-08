//
//  Token.swift
//  
//
//  Created by Dawid Nadolski on 27/08/2021.
//

import Vapor
import Fluent

enum SessionSource: Int, Content {
	case signup
	case login
}

final class Token: Model {
	static let schema = "tokens"
	
	@ID(key: "id")
	var id: UUID?
	
	@Parent(key: "userId")
	var user: User
	
	@Field(key: "value")
	var value: String
	
	@Field(key: "source")
	var source: SessionSource
	
	@Field(key: "expiresAt")
	var expiresAt: Date?
	
	@Timestamp(key: "createdAt", on: .create)
	var createdAt: Date?
	
	init() {}
	
	init(id: UUID? = nil, userId: User.IDValue, token: String,
		 source: SessionSource, expiresAt: Date?) {
		self.id = id
		self.$user.id = userId
		self.value = token
		self.source = source
		self.expiresAt = expiresAt
	}
}

extension Token: ModelTokenAuthenticatable {
	static let valueKey = \Token.$value
	static let userKey = \Token.$user
	
	var isValid: Bool {
		guard let expiryDate = expiresAt else {
			return true
		}
		
		return expiryDate > Date()
	}
}
