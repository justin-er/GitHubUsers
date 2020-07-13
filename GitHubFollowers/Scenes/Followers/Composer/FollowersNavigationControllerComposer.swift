//
//  FollowersNavigationControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 13.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FollowersNavigationControllerComposer {
	
	static func makeModule() -> (UINavigationController, FollowersViewControllerInput) {
		
		let followersVC = FollowersViewControllerComposer.makeModule()
		let followersNC = UINavigationController(rootViewController: followersVC)
		
		return (followersNC, followersVC)
	}
}

