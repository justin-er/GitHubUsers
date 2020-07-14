//
//  UserInfoDelegate.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol UserPresenterDelegate: class {
	
	func presenterDidGet(result: Result<UserViewModel, UserNetworkError>)
	
	func presenterDidGetAvatar(result: Result<UserViewModel, UserNetworkError>)
	
	func presenterDidAddUserToFavories(_: UserPresenterInput, user: UserViewModel, error: Error?)
}

