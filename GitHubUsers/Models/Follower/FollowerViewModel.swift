//
//  FollowerViewModel.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FollowerViewModel {
	
	var login: String
	var avatarUrl: String
	var avatar: UIImage?
	var id: UUID
	
	init(with follower: Follower) {
		
		self.login = follower.login
		self.avatarUrl = follower.avatarUrl
		self.avatar = nil
		self.id = follower.id
	}
	
	init(with follower: Follower, avatarData: Data) {
		
		self.login = follower.login
		self.avatarUrl = follower.avatarUrl
		self.avatar = UIImage(data: avatarData)
		self.id = follower.id
	}
}

extension FollowerViewModel {
	
	func makeFollower() -> Follower {
		return Follower(login: self.login,
								avatarUrl: self.avatarUrl,
								id: self.id)
	}
}

extension FollowerViewModel: Equatable {
	
	static func == (lhs: FollowerViewModel, rhs: FollowerViewModel) -> Bool {
		return lhs.id == rhs.id
	}
}

extension FollowerViewModel: Hashable {
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

