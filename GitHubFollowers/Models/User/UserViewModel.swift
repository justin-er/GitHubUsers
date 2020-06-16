//
//  UserViewModel.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct UserViewModel {
	
	let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
	
	var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy.MM.dd, HH:mm"
		return formatter
	}()
	
	init(user: User) {
		
		self.login 			= user.login
		self.avatarUrl 		= user.avatarUrl
		self.name 			= user.name
		self.location 		= user.location
		self.bio 			= user.bio
		self.publicRepos 	= user.publicRepos
		self.publicGists	= user.publicGists
		self.htmlUrl		= user.htmlUrl
		self.following 		= user.following
		self.followers		= user.followers
		self.createdAt 		= dateFormatter.string(from: user.createdAt)
	}
}

