//
//  FollowersPresenterInput.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 23.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowersPresenterInput {
	
	func filter(with filter: String) -> [FollowerViewModel]
	
	func cancelFilter() -> [FollowerViewModel]
}

