//
//  UserInfoNavigationControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class UserNavigationControllerComposer {
	
	static func makeModule(followersViewControllerInput: FollowersViewControllerInput) -> (UINavigationController, UserViewControllerInput) {
		
		let vc = UserViewControllerComposer.makeModule(followersViewControllerInput: followersViewControllerInput)
		let nc = UINavigationController(rootViewController: vc)
		
		return (nc, vc)
	}
}

