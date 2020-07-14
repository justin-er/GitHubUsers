//
//  UserInfoNetworkProviderInput.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol UserNetworkProviderInput {
	
	func getUser(username: String, completion: @escaping (Result<User, UserNetworkError>) -> Void)
	
	func getAvatar(user: User, completion: @escaping (Result<(User, Data), UserNetworkError>) -> Void)
}
