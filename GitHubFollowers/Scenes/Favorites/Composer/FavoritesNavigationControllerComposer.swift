//
//  FavoriteNavigationControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FavoritesNavigationControllerComposer {
	
	static func makeModule() -> UINavigationController {
		
		let vc = FavoritesViewControllerComposer.makeModule()
		let nv = UINavigationController()
		nv.viewControllers = [vc]
		
		return nv
	}
}

