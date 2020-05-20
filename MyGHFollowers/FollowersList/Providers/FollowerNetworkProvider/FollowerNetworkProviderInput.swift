//
//  RemoteFollowersProviderInput.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 05.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowerNetworkProviderInput {
	
	typealias Completion = (Result<[FollowerNetowrkModel], FollowerError>) -> Void
	
	func fetchFollowers(of username: String, pageNumber: Int, completion: Completion?)
}

