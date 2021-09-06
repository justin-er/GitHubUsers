//
//  UserInfoViewControllerComposer.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class UserViewControllerComposer {
    
    static func makeModule() -> UserViewController {
        
        let userNetworkProvider = UserNetworkProvider(session: URLSession.shared)
        let persistenceProvider = UserDefaultsPersistenceProvider()
        let userInteractor 		= UserInteractor(userNetworkProvider: userNetworkProvider, persistenceProvider: persistenceProvider)
        let userPresenter 		= UserPresenter(interactor: userInteractor)
        userInteractor.delegate = userPresenter
        let loadingViewProvider	= LoadingViewProvider()
        let alertViewProvider	= AlertViewControllerProvider()
        
        let viewController 		= UserViewController(
            presenter: userPresenter,
            loadingViewProvider: loadingViewProvider,
            alertViewProvider: alertViewProvider)
        
        userPresenter.delegate 	= viewController
        
        return viewController
    }
}
