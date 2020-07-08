//
//  FollowersPresenterDelegate.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowersPresenterDelegate: class {
	
	func presenterDidStartGetting(_ presenter: FollowersPresenterInput)
	
	func presenterDidGet(_ presenter: FollowersPresenterInput, result: Result<[FollowerViewModel], FollowerNetworkError>)
	
	func presenterDidStartGettingNext(_ presenter: FollowersPresenterInput)
	
	func presenterDidGetNext(_ presenter: FollowersPresenterInput, result: Result<[FollowerViewModel], FollowerNetworkError>)
	
	func presenterDidGetAvater(_ presenter: FollowersPresenterInput, followerViewModel: FollowerViewModel)
}

