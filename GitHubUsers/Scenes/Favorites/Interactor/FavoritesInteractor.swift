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
	
	init(persistenceProvider: PersistenceProvider) {
		
		self.persistenceProvider 		= persistenceProvider
	}
	
	var delegate: FavoritesInteractorDelegate?
	
	func getFavorites() {
		
		let favorites = persistenceProvider.retreiveFavorites()
		delegate?.interactorDidGet(self, favorites: favorites)
	}
	
}

