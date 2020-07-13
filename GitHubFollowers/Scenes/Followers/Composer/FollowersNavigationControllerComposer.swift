//
//  FollowersNavigationControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 13.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FollowersNavigationControllerComposer {
	
	static func makeModule(userViewController: UserViewControllerInput) -> (UINavigationController, FollowersViewControllerInput) {
		
		let followersVC = FollowersViewControllerComposer.makeModule(userViewController: userViewController)
		let followersNC = UINavigationController(rootViewController: followersVC)
		
		return (followersNC, followersVC)
	}
}

