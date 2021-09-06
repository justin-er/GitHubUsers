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

    let interactor: UserInteractorInput
    
    init(interactor: UserInteractorInput) {
        self.interactor = interactor
    }
    
    func getUser(username: String) {
        self.interactor.getUser(username: username)
    }
    
    func getAvatar(user: UserViewModel) {
        self.interactor.getAvatar(user: user.makeUser())
    }
    
    func addUserToFavorites(user: UserViewModel) {
        self.interactor.addUserToFavorites(user: user.makeUser())
    }
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
	
	func interactoreDidGetAvatar(user: User, result: Result<Data, AvatarNetworkError>) {
		
		switch result {
			
		case .failure(let error):
			
			self.delegate?.presenterDidGetAvatar(result: Result.failure(error))
			
		case .success(let data):
			
			var userViewModel = UserViewModel(user: user)
			userViewModel.avatar = UIImage(data: data)
			self.delegate?.presenterDidGetAvatar(result: Result.success(userViewModel))
		}
	}
	
	func interactoreDidAddUserToFavories(_: UserInteractorInput, user: User, error: Error?) {
		
		delegate?.presenterDidAddUserToFavories(self, user: UserViewModel(user: user), error: error)
	}
}
