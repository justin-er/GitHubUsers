//
//  NetworkError.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 27.04.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

enum FollowerNetworkError: Error, LocalizedError  {
	
	case invalidUsername
    case unableToComplete
	
	var errorDescription: String? {
		switch self {
		case .invalidUsername:
			return "Invalid username."
		case .unableToComplete:
			return "Unable to complete network request. Check the Internet connection."
		}
	}
}
