//
//  FavoritesInteractorInput.swift
//  GitHubUsers
//
//  Created by Amirreza Eghtedari on 14.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FavoritesInteractorInput {
	
	func getFavorites()
	
	func getAvatar(for user: User)
}

