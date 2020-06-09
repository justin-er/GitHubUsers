//
//  Follower.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 05.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class Follower {
	
	var login: String
    var avatarUrl: String
	var avatar: Avatar?
	var id: UUID
	
	init(login: String, avatarUrl: String, avatar: Avatar? = nil, id: UUID) {
		self.login = login
		self.avatarUrl = avatarUrl
		self.avatar = avatar
		self.id = id
	}
	
	convenience init(login: String, avatarUrl: String, avatar: Avatar? = nil) {
		self.init(login: login, avatarUrl: avatarUrl, avatar: avatar, id: UUID())
	}
}

