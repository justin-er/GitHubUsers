//
//  RemoteFollowersProviderInput.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 05.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowerNetworkProviderInput {
	
	typealias Completion = (Result<[FollowerNetowrkModel], FollowerNetworkError>) -> Void
	
	func getFollowers(of username: String, pageNumber: Int, completion: Completion?)
	
	func getAccountAvatar(urlString: String, completion: @escaping (Result<Data, AvatarNetworkError>) -> Void)
	
}

