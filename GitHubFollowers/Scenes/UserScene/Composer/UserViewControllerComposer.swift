//
//  UserInfoViewControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class UserViewControllerComposer {
	
	static func makeModule(follower: FollowerViewModel) -> UserViewController {
		
		let userNetworkProvider = UserNetworkProvider()
		let userInteractor = UserInteractor(userNetworkProvider: userNetworkProvider)
		return UserViewController(follower: follower, interactor: userInteractor)
	}
}

