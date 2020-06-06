//
//  FollowersComposer.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class FollowersViewControllerComposer {

	static func makeModule() -> FollowersViewController {
		
		let viewController = FollowersViewController()
		let remoteFollowersProvider = FollowerNetworkProvider(session: NetworkManager.shared.session)
		let interactor = FollowersInteractor()
		let presenter = FollowersPresenter()
		
		viewController.interactor = interactor
		interactor.followersProvider = remoteFollowersProvider
		interactor.delegate = presenter
		presenter.delegate = viewController
		
		return viewController
	}
}

