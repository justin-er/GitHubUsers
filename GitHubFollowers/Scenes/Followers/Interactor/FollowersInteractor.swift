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
	
	enum ResultType {
		case first, next
	}
	
	let followersProvider: 		FollowerNetworkProviderInput
	let userProvider:			UserNetworkProviderInput
	let persistenceProvider:	PersistenceProvider
	
	var delegate: 				FollowersInteractorDelegate?
	
	var isMoreFollowers: Bool {
		return followersProvider.isMoreFollowers
	}
	
	init(followersProvider: FollowerNetworkProviderInput, userProvider: UserNetworkProviderInput, persistenceProvider: PersistenceProvider) {
		
		self.followersProvider 		= followersProvider
		self.userProvider			= userProvider
		self.persistenceProvider	= persistenceProvider
	}
	
	fileprivate func processResult(_ result: Result<[FollowerNetowrkModel], FollowerNetworkError>, type: ResultType) {
		
		switch result {
		case .failure(let error):
			os_log("Error: %@", log: OSLog(subsystem: "Network Communication", category: "Error"), type: .default, error.localizedDescription)
			self.delegate?.interactorDidGet(self, result: Result.failure(error))
		case .success(let followersNetworkModel):
			let followers = followersNetworkModel.map { item -> Follower in
				item.makeFollower()
			}
			
			switch type {
			case .first:
				self.delegate?.interactorDidGet(self, result: Result.success(followers))
			case .next:
				self.delegate?.interactorDidGetNext(self, result: Result.success(followers))
			}
			
		}
	}
	
	func getFollowers(of username: String) {
		
		followersProvider.getFollowers(of: username) {[weak self] result in
			self?.processResult(result, type: .first)
		}
	}
	
	func getNextFollowers() {
		
		if isMoreFollowers {
			followersProvider.getNextFollowers {[weak self] result in
				self?.processResult(result, type: .next)
			}
		}
	}
	
	func getAvatar(of follower: Follower) {
		
		followersProvider.getAvatar(for: follower) { [weak self] (result) in
			
			guard let self = self else { return }
			
			switch result {
				
			case .failure(let error):
				
				os_log("Error: %@", log: OSLog(subsystem: "Network Communication", category: "Error"), type: .default, error.localizedDescription)
				
			case .success(let (follower, data)):
				
				self.delegate?.interactorDidGetAvatar(self, follower: follower, avatar: data)
			}
		}
	}
	
	func addUserToFavorites(username: String) {
		
		userProvider.getUser(username: username) { [weak self] result in
			
			guard let self = self else { return }
			
			switch result {
				
			case .failure(let error):
				
				self.delegate?.interactoreDidAddUserToFavories(self, username: username, error: error)
				
			case .success(let user):
				
				do {
					
					try self.persistenceProvider.add(favorite: user)
					self.delegate?.interactoreDidAddUserToFavories(self, username: username, error: nil)
				
				} catch {
					
					self.delegate?.interactoreDidAddUserToFavories(self, username: username, error: error)
				}
			}
		}
	}
}

