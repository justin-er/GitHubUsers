//
//  FavoritesInteractorDelegate.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 13.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FavoritesInteractorDelegate {
	
	func interactorDidGet(_ interactor: FavoritesInteractorInput ,favorites: [User]?)
	
	func interactorDidGetAvatar(_ interacator: FavoritesInteractorInput, user: User, result: Result<Data, AvatarNetworkError>)
	
	func interactorDidDeleteFavorite(_ interactor: FavoritesInteractorInput, user: User)
}

