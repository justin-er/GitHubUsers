//
//  FolloweresInput.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowersInteractorInput {
	
	var isMoreFollowers: Bool { get }
	
	func getFollowers(of username: String)
	
	func getNextFollowers()
	
	func getAvatar(of follower: Follower)
}
