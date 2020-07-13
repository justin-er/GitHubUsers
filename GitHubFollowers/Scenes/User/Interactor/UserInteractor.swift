//
//  UserInfoInteractor.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class UserInteractor: UserInteractorInput {
	
	private let userNetworkProvider: UserNetworkProviderInput
	private let persistenceProvider: PersistenceProvider
	
	var delegate: UserInteractorDelegate?
	
	init(userNetworkProvider: UserNetworkProviderInput, persistenceProvider: PersistenceProvider) {
		
		self.persistenceProvider = persistenceProvider
		self.userNetworkProvider = userNetworkProvider
	}
	
	func getUser(username: String) {
		
		userNetworkProvider.getUser(username: username) { result in
			
			self.delegate?.interactorDidGet(result: result)
		}
	}
	
	func getAvatar(user: User) {
		
		userNetworkProvider.getAvatar(user: user) { result in
			
			self.delegate?.interactoreDidGetAvatar(result: result)
		}
	}
	
	func addUserToFavorites(user: User) {
		
		do {
			
			try persistenceProvider.add(favorite: user)
			
		} catch {
			
			delegate?.interactoreDidAddUserToFavories(self, user: user, error: error)
		}
		
		delegate?.interactoreDidAddUserToFavories(self, user: user, error: nil)
	}
}
