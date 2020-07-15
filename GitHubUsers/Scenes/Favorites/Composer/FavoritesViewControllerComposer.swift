//
//  FavoriteViewControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FavoritesViewControllerComposer {
	
	static func makeModule() -> FavoritesViewController {
		
		let persistenceProvider = UserDefaultsPersistenceProvider()
		let userNetworkProvider = UserNetworkProvider(session: NetworkManager.shared.session)
		let interactor			= FavoritesInteractor(persistenceProvider: persistenceProvider, userNetworkProvider: userNetworkProvider)
		let presenter			= FavoritesPresenter()
		let userViewController 	= UserViewControllerComposer.makeModule()
		let viewController = FavoritesViewController(interactor: interactor, userViewController: userViewController)
		
		interactor.delegate		= presenter
		presenter.delegate		= viewController
		
		return viewController
	}
}

