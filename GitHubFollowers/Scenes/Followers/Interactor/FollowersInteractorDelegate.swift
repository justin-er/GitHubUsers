//
//  FollowersInteractorDelegate.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowersInteractorDelegate: class {
	
	func interactroDidStartGetting(_: FollowersInteractorInput)
	
	func interactorDidGet(_: FollowersInteractorInput, result: Result<[Follower], FollowerNetworkError>)
	
	func interactroDidStartGettingNext(_: FollowersInteractorInput)
	
	func interactorDidGetNext(_: FollowersInteractorInput, result: Result<[Follower], FollowerNetworkError>)
	
	func interactorDidGetAvatar(_: FollowersInteractorInput, follower: Follower)
}

