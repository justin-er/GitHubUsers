//
//  UserInfoDelegate.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol UserPresenterDelegate: AnyObject {
	
	func presenterDidGet(result: Result<UserViewModel, UserNetworkError>)
	func presenterDidGetAvatar(result: Result<UserViewModel, AvatarNetworkError>)
	func presenterDidAddUserToFavories(_: UserPresenterInput, user: UserViewModel, error: Error?)
}

