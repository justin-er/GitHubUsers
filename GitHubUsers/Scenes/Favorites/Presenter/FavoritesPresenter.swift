//
//  FavoritesPresenter.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 13.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FavoritesPresenter: FavoritesPresenterInput {
	
	weak var delegate: FavoritesPresenterDelegate?
}

//MARK:- FavoritesInteractorDelegate

extension FavoritesPresenter: FavoritesInteractorDelegate {
	
	func interactorDidGet(_ interactor: FavoritesInteractorInput ,favorites: [User]?) {

		let usersViewModel = favorites?.map({ user -> UserViewModel in
			
			return UserViewModel(user: user)
		})
		
		delegate?.presenterDidGet(self, favorites: usersViewModel)
	}
	
	func interactorDidGetAvatar(_ interacator: FavoritesInteractorInput, user: User, result: Result<Data, AvatarNetworkError>) {
		
		var userViewModel = UserViewModel(user: user)
		switch result {
		
		case .failure(let error):
			
			delegate?.presenterDidGetAvatar(self, user: userViewModel, result: Result.failure(error))
			
		case .success(let data):
			
			guard let avatar = UIImage(data: data) else {
				
				delegate?.presenterDidGetAvatar(self, user: userViewModel, result: Result.failure(AvatarNetworkError.unableToComplete))
				
				return
			}
			
			userViewModel.avatar = avatar
			delegate?.presenterDidGetAvatar(self, user: userViewModel, result: Result.success(avatar))
		}
	}
}

