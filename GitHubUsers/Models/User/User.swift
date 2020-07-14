//
//  User.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 05.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct User: Codable {
	
	let login: String
	let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: Date
	let id: UUID
}

extension User: Equatable {
	
	static func == (lhs: User, rhs: User) -> Bool {
		
		return lhs.id == rhs.id
	}
}

