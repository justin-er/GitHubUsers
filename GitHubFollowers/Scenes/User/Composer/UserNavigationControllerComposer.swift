//
//  UserInfoNavigationControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class UserNavigationControllerComposer {
	
	static func makeModule(follower: FollowerViewModel, followersViewControllerInput: FollowersViewControllerInput) -> UINavigationController {
		
		let userInfoVC = UserViewControllerComposer.makeModule(follower: follower,
															   followersViewControllerInput: followersViewControllerInput)
		let nc = UINavigationController(rootViewController: userInfoVC)
		return nc
	}
}

