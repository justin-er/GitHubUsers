//
//  FollowersInteractorDelegate.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowersInteractorDelegate: class {
	
	func interactorDidGet(result: Result<[Follower], FollowerNetworkError>)
	
	func interactorDidGetAvatar(follower: Follower)
}

