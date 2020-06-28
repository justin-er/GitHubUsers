//
//  UserInfoDelegate.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol UserInteractorDelegate: class {
	
	func interactorDidGet(result: Result<User, UserNetworkError>)
}

