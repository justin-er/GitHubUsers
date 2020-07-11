//
//  UserInfoPresenter.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class UserPresenter: UserPresenterInput {
	
	public let interactor: UserInteractorInput
	weak var delegate: UserPresenterDelegate?
	
	init(interactor: UserInteractorInput) {
		
		self.interactor = interactor
	}
	
	private var avatar: UIImage?

	func getUserDetail(of follower: FollowerViewModel) {
		
		self.avatar = follower.avatar
		interactor.getUser(username: follower.login)
	}
}

extension UserPresenter: UserInteractorDelegate {
	
	func interactorDidGet(result: Result<User, UserNetworkError>) {
		
		switch result {
			
		case .failure(let userNetworkError):
			
			delegate?.presenterDidGet(result: Result.failure(userNetworkError))
		
		case .success(let user):
			
			var userViewModel = UserViewModel(user: user)
			userViewModel.avatar = self.avatar
			delegate?.presenterDidGet(result: Result.success(userViewModel))
		}
	}

}
