//
//  PresistenceProvider.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol PersistenceProvider {
	
	func retreiveFavorites() -> [Follower]?
	
	func add(favorite: Follower)
	
	func update(favorite: Follower)
	
	func delete(favorite: Follower)
}

