//
//  FollowersPresenterDelegate.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowersPresenterDelegate: class {
	
	func presenterDidGet(_ presenter: FollowersPresenterInput, result: Result<[FollowerViewModel], FollowerNetworkError>)
	
	func presenterDidGetNext(_ presenter: FollowersPresenterInput, result: Result<[FollowerViewModel], FollowerNetworkError>)
	
	func presenterDidGetAvater(_ presenter: FollowersPresenterInput, followerViewModel: FollowerViewModel)
	
	func presenterDidAddUserToFavories(_: FollowersPresenterInput, username: String, error: Error?)
}

