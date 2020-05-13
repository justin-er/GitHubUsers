//
//  FollowersPresenter.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class FollowersPresenter: FollowersInteractorDelegate {
	
	weak var delegate: FollowersPresenterDelegate?
	
	func iteractorDidGet(followers: [Follower]) {
		for follower in followers {
			print(follower.login)
		}
	}
	
}

