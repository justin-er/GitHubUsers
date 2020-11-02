//
//  SearchNavigationControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class SearchNavigationControllerComposer {
	
	static func makeModule() -> UINavigationController {
		
		let viewController = SearchViewControllerComposer.makeModue()
		let navigationController = UINavigationController()
        navigationController.viewControllers = [viewController]
        
        return navigationController
	}
}

