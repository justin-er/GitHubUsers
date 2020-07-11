//
//  PersistenceProviderError.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

enum PersistenceProviderError: Error, LocalizedError {
	
	case addingFailed
	
	var errorDescription: String? {
		
		switch self {
		
		case .addingFailed:
			
			return "This user has been added previously."
		}
	}
}

