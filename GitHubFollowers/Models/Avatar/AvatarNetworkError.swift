
//
//  AvatarNetworkError.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 23.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

enum AvatarNetworkError: Error, LocalizedError {
	
	case invalidAvatarUrl
    case unableToComplete
	
	var errorDescription: String? {
		switch self {
		case .invalidAvatarUrl:
			return "Invalid avatar Url."
		case .unableToComplete:
			return "Unable to complete network request. Check the Internet connection."
		}
	}
}

