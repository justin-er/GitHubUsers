//
//  FollowersPresenterDelegate.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowersPresenterDelegate: class {
	
	func presenterDidStartGettingFollowers(_ presenter: FollowersPresenterInput, of username: String)
	
	func presenterDidGet(_ presenter: FollowersPresenterInput, result: Result<[FollowerViewModel], FollowerNetworkError>)
	
	func presenterDidStartGettingNextFollowers(_ presenter: FollowersPresenterInput)
	
	func presenterDidGetNext(_ presenter: FollowersPresenterInput, result: Result<[FollowerViewModel], FollowerNetworkError>)
	
	func presenterDidGetAvater(_ presenter: FollowersPresenterInput, followerViewModel: FollowerViewModel)
}

