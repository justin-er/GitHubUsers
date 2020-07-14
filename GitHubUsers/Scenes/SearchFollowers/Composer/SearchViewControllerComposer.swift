//
//  SearchViewControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class SearchViewControllerComposer {
	
	static func makeModue() -> SearchViewController {
		
		let viewController = SearchViewController(alertViewProvider: AlertViewControllerProvider())
        return viewController
	}
}

