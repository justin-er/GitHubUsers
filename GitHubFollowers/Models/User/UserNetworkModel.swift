//
//  User.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 20.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct UserNetworkModel: Codable {
	
	enum CodingKeys: String, CodingKey {
		case login			= "login"
		case avatarUrl		= "avatar_url"
		case name			= "name"
		case location		= "location"
		case bio			= "bio"
		case publicRepos	= "public_repos"
		case publicGists	= "public_gists"
		case htmlUrl		= "html_url"
		case following		= "following"
		case followers		= "followers"
		case createdAt		= "created_at"
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
	
	var dateFormatter: ISO8601DateFormatter = {
		let dateFormatter = ISO8601DateFormatter()
		dateFormatter.formatOptions = [ISO8601DateFormatter.Options.withYear, .withMonth, .withDay, .withFullTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
		return dateFormatter
	}()
}

extension UserNetworkModel {
	
	func makeUser() -> User? {

		guard let createdAt = dateFormatter.date(from: createdAt) else { return nil }
		
		return User(login: 			login,
					avatarUrl: 		avatarUrl,
					name:	 		name,
					location: 		location,
					bio: 			bio,
					publicRepos: 	publicRepos,
					publicGists: 	publicGists,
					htmlUrl: 		htmlUrl,
					following: 		following,
					followers: 		followers,
					createdAt: 		createdAt)
	}
}
