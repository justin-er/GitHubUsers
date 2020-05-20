//
//  FollowersInteractorDelegate.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowersInteractorDelegate: class {
	
	func iteractorDidGet(result: Result<[Follower], FollowerError>)
}

