//
//  FollowerViewModel.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class FollowerViewModel {
	
	var login: String
	var avatarUrl: String
	var avatar: Avatar?
	
	init(with follower: Follower) {
		self.login = follower.login
		self.avatarUrl = follower.avatarUrl
		self.avatar = follower.avatar
	}
}

extension FollowerViewModel {
	
	func makeFollower() -> Follower {
		return Follower(login: self.login,
								avatarUrl: self.avatarUrl,
								avatar: self.avatar)
	}
}

extension FollowerViewModel: Equatable {
	
	static func == (lhs: FollowerViewModel, rhs: FollowerViewModel) -> Bool {
		return lhs.login == rhs.login
	}
}

extension FollowerViewModel: Hashable {
	func hash(into hasher: inout Hasher) {
		hasher.combine(login)
	}
}

