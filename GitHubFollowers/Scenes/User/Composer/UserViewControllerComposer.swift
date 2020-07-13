//
//  UserInfoViewControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class UserViewControllerComposer {
	
	static func makeModule(followersViewControllerInput: FollowersViewControllerInput) -> UserViewController {
		
		let userNetworkProvider = UserNetworkProvider(session: URLSession.shared)
		let userInteractor 		= UserInteractor(userNetworkProvider: userNetworkProvider)
		let userPresenter 		= UserPresenter()
		userInteractor.delegate = userPresenter
		let loadingViewProvider	= LoadingViewProvider()
		let alertViewProvider	= AlertViewControllerProvider()
		
		let viewController 		= UserViewController(interactor: userInteractor,
														loadingViewProvider: loadingViewProvider,
														followersViewControllerInput: followersViewControllerInput,
														alertViewProvider: alertViewProvider)
														
		userPresenter.delegate 	= viewController
		
		return viewController
	}
}
