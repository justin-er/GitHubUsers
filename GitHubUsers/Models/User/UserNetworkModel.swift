//
//  UserNetworkModel.swift
//  GitHubUsers
//
//  Created by Amirreza Eghtedari on 14.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct UserNetworkModel: Codable {
	
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
    let createdAt: Date
}

extension UserNetworkModel {
	
	func makeUser() -> User {
		
		let user = User(login: self.login,
						avatarUrl: self.avatarUrl,
						name: self.name,
						location: self.location,
						bio: self.bio,
						publicRepos: self.publicRepos,
						publicGists: self.publicGists,
						htmlUrl: self.htmlUrl,
						following: self.following,
						followers: self.followers,
						createdAt: self.createdAt)
		return user
	}
}

