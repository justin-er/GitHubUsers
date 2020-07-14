//
//  UserNetworkError.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

enum UserNetworkError: Error, LocalizedError {
	
	case invalidUsername
    case unableToComplete
	case invalidAvatarUrl
	
	var errorDescription: String? {
		switch self {
		case .invalidUsername:
			return "Invalid username."
		case .unableToComplete:
			return "Unable to complete network request. Check the Internet connection."
		case .invalidAvatarUrl:
			return "Invalid avater URL."
		}
	}
}

