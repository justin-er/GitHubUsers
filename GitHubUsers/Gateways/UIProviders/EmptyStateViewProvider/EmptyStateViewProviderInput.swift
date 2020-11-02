//
//  EmptyStateViewProviderInput.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

protocol EmptyStateViewProviderInput {
	
	func showEmptyState(message: String, on view: UIView)
	
	func dismissEmptyState()
}
