//
//  Follower.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 05.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class Follower: Codable {
	
	var login: String
    var avatarUrl: String
	var id: UUID
	
	init(login: String, avatarUrl: String, id: UUID) {
		self.login = login
		self.avatarUrl = avatarUrl
		self.id = id
	}
	
	convenience init(login: String, avatarUrl: String) {
		self.init(login: login, avatarUrl: avatarUrl, id: UUID())
	}
}

extension Follower: Equatable {
	
	static func == (lhs: Follower, rhs: Follower) -> Bool {
		
		return lhs.login == rhs.login
	}
}



