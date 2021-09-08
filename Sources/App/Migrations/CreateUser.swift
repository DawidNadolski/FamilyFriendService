//
//  CreateUser.swift
//  
//
//  Created by Dawid Nadolski on 27/08/2021.
//

import Fluent

struct CreateUser: Migration {
  func prepare(on database: Database) -> EventLoopFuture<Void> {
	database.schema(User.schema)
	  .field("id", .uuid, .identifier(auto: true))
	  .field("username", .string, .required)
	  .unique(on: "username")
	  .field("passwordHash", .string, .required)
	  .field("createdAt", .datetime, .required)
	  .field("updatedAt", .datetime, .required)
	  .create()
  }

  func revert(on database: Database) -> EventLoopFuture<Void> {
	database.schema(User.schema).delete()
  }
}
