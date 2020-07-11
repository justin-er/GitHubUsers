//
//  PresistenceProvider.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol PersistenceProvider {
	
	func retreiveFavorites() -> [User]?
	
	func add(favorite: User) throws
	
	func delete(favorite: User)
	
	func deleteAll()
}

