//
//  FollowersInteractor.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation
import os

class FollowersInteractor: FollowersInteractorInput {
	
	var followersProvider: FollowerNetworkProviderInput!
	var delegate: FollowersInteractorDelegate?
	
	func getFollowers(of username: String, pageNumber: Int) {
		followersProvider.getFollowers(of: username, pageNumber: pageNumber) {[weak self] result in
			switch result {
			case .failure(let error):
				os_log("Error: %@", log: OSLog(subsystem: "Network Communication", category: "Error"), type: .default, error.localizedDescription)
				self?.delegate?.interactorDidGet(result: Result.failure(error))
			case .success(let followersNetworkModel):
				let followers = followersNetworkModel.map { item -> Follower in
					item.makeFollower()
				}
				self?.delegate?.interactorDidGet(result: Result.success(followers))
			}
		}
	}
	
	func getAvatar(of follower: Follower) {
		
		followersProvider.getAvatar(for: follower) { [weak self] (result) in
			switch result {
			case .failure(let error):
				os_log("Error: %@", log: OSLog(subsystem: "Network Communication", category: "Error"), type: .default, error.localizedDescription)
			case .success(let follower):
				self?.delegate?.interactorDidGetAvatar(follower: follower)
			}
		}
	}
}

