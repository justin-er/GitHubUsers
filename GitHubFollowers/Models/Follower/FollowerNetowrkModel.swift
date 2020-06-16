//
//  Follower.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 12/1/1399AP.
//  Copyright © 1399 AP Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct FollowerNetowrkModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatarUrl = "avatar_url"
    }
    
    var login: String
    var avatarUrl: String
	
	func makeFollower() -> Follower {
		let follower = Follower(login: self.login,
								avatarUrl: self.avatarUrl)
		
		return follower
	}
}


