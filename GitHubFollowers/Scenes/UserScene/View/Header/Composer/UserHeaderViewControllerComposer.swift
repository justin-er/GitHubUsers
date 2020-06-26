//
//  UserHeaderViewControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 26.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class UserHeaderViewControllerComposer {
	
	static func makeModule(user: UserHeaderViewModel) -> UserHeaderViewController {
		
		let viewController = UserHeaderViewController(user: user)
		return viewController
	}
}
