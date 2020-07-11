//
//  UserDefaultsPersistenceProvider.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class UserDefaultsPersistenceProvider: PersistenceProvider {
	
	let userDefaults = UserDefaults.standard
	
	func save(favorites: [Follower]) throws {
		
//		let encoder = JSONEncoder()
//		let deocdedData = encoder.encode([Follower])
//		userDefaults.set(
	}
	
	func retreiveFavorites() -> [Follower]? {
		
		return [Follower]()
	}
	
	func add(favorite: Follower) {
		
	}
	
	func update(favorite: Follower) {
		
	}
	
	func delete(favorite: Follower) {
		
	}
}

