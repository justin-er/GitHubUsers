//
//  UserInfoInteractorInput.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol UserInteractorInput {
	
	func getUser(username: String)
	
	func getAvatar(user: User)
	
	func addUserToFavorites(user: User)
}
