//
//  UserInfoPresenter.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class UserPresenter: UserPresenterInput {
	
	weak var delegate: UserPresenterDelegate?
}

extension UserPresenter: UserInteractorDelegate {
	
	func interactorDidGet(result: Result<User, UserNetworkError>) {
		
		switch result {
		case .failure(let userNetworkError):
			delegate?.presenterDidGet(result: Result.failure(userNetworkError))
		case .success(let user):
			delegate?.presenterDidGet(result: Result.success(UserViewModel(user: user)))
		}
	}

}
