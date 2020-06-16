//
//  UserInfoInteractor.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class UserInteractor: UserInteractorInput {
	
	private let userNetworkProvider: UserNetworkProviderInput
	
	init(userNetworkProvider: UserNetworkProviderInput) {
		
		self.userNetworkProvider = userNetworkProvider
	}
	
	func getUser(username: String) {
		
		userNetworkProvider.getUser(username: username) { result in
			
			print(result)
		}
	}
}
