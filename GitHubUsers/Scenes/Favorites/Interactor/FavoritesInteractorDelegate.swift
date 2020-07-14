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
}

