//
//  UserInfoPresenter.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class UserPresenter: UserPresenterInput {
	
	weak var delegate: UserPresenterDelegate?
}

extension UserPresenter: UserInteractorDelegate {
	
	func interactorDidGet(result: Result<User, UserNetworkError>) {
		
		switch result {
			
		case .failure(let userNetworkError):
			
			delegate?.presenterDidGet(result: Result.failure(userNetworkError))
		
		case .success(let user):
			
			let userViewModel = UserViewModel(user: user)
			delegate?.presenterDidGet(result: Result.success(userViewModel))
		}
	}
	
	func interactoreDidGetAvatar(result: Result<(User, Data), UserNetworkError>) {
		
		switch result {
			
		case .failure(let error):
			
			self.delegate?.presenterDidGetAvatar(result: Result.failure(error))
			
		case .success(let(user, data)):
			
			var userViewModel = UserViewModel(user: user)
			userViewModel.avatar = UIImage(data: data)
			self.delegate?.presenterDidGetAvatar(result: Result.success(userViewModel))
		}
	}
	
	func interactoreDidAddUserToFavories(_: UserInteractorInput, user: User, error: Error?) {
		
		delegate?.presenterDidAddUserToFavories(self, user: UserViewModel(user: user), error: error)
	}
}
