//
//  FollowerViewModel.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct FollowerViewModel {
	var login: String
    var avatarUrl: String

	init(with follower: Follower) {
		self.login = follower.login
		self.avatarUrl = follower.avatarUrl
	}

}

