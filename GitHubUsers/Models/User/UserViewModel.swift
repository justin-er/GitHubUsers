//
//  UserViewModel.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class UserViewModel {
	
	internal init(login: String, avatarUrl: String, name: String? = nil, location: String? = nil, bio: String? = nil, publicRepos: Int, publicGists: Int, htmlUrl: String, following: Int, followers: Int, createdAt: String, avatar: UIImage? = nil) {
		
		self.login = login
		self.avatarUrl = avatarUrl
		self.name = name
		self.location = location
		self.bio = bio
		self.publicRepos = publicRepos
		self.publicGists = publicGists
		self.htmlUrl = htmlUrl
		self.following = following
		self.followers = followers
		self.createdAt = createdAt
		self.avatar = avatar
	}
	
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
	var avatar: UIImage?
	
	var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM yyyy"
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
	
	func makeUser() -> User {
		
		return User(login: self.login,
						avatarUrl: self.avatarUrl,
						name: self.name,
						location: self.location,
						bio: self.bio,
						publicRepos: self.publicRepos,
						publicGists: self.publicGists,
						htmlUrl: self.htmlUrl,
						following: self.following,
						followers: self.followers,
						createdAt: dateFormatter.date(from: self.createdAt) ?? Date())
	}
}

extension UserViewModel: Equatable {
	
	static func == (lhs: UserViewModel, rhs: UserViewModel) -> Bool {
		
		return lhs.login == rhs.login
	}
}

extension UserViewModel: Hashable {
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(login)
	}
}

