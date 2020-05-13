//
//  FollowersInteractor.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import os

class FollowersInteractor: FolloweresInteractorInput {
	
	var followersProvider: FollowerNetworkProviderInput!
	var delegate: FollowersInteractorDelegate?
	
	func fetchFollowers(of username: String, pageNumber: Int) {
		followersProvider.fetchFollowers(of: username, pageNumber: pageNumber) {[weak self] result in
			switch result {
			case .failure(let error):
				os_log("Error: %@", log: OSLog(subsystem: "Network Communication", category: "Error"), type: .default, error.localizedDescription)
			case .success(let followersNetworkModel):
				let followers = followersNetworkModel.map { item -> Follower in
					item.makeFollower()
				}
				self?.delegate?.iteractorDidGet(followers: followers)
			}
		}
	}
}

