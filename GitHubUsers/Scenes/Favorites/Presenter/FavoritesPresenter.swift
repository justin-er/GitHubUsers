//
//  FavoritesPresenter.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 13.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class FavoritesPresenter: FavoritesPresenterInput {
	
	weak var delegate: FavoritesPresenterDelegate?
}

//MARK:- FavoritesInteractorDelegate

extension FavoritesPresenter: FavoritesInteractorDelegate {
	
	func interactorDidGet(_ interactor: FavoritesInteractorInput ,favorites: [User]?) {

		let usersViewModel = favorites?.map({ user -> UserViewModel in
			
			return UserViewModel(user: user)
		})
		
		delegate?.presenterDidGet(self, favorites: usersViewModel)
	}
}

