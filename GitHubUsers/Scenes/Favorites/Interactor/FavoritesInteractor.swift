//
//  FavoritesInteractor.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 13.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class FavoritesInteractor: FavoritesInteractorInput {
	
	let persistenceProvider: PersistenceProvider
	let userNetworkProivder: UserNetworkProviderInput
	
	init(persistenceProvider: PersistenceProvider, userNetworkProvider: UserNetworkProviderInput) {
		
		self.persistenceProvider 		= persistenceProvider
		self.userNetworkProivder		= userNetworkProvider
	}
	
	var delegate: FavoritesInteractorDelegate?
	
	func getFavorites() {
		
		let favorites = persistenceProvider.retreiveFavorites()
		delegate?.interactorDidGet(self, favorites: favorites)
	}
	
	func getAvatar(for user: User) {
		
		userNetworkProivder.getAvatar(for: user) { user, result in
			
			self.delegate?.interactorDidGetAvatar(self, user: user, result: result)
		}
	}
	
}

