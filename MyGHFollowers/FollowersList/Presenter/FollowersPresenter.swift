//
//  FollowersPresenter.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class FollowersPresenter: FollowersPresenterInput {
	
	weak var delegate: FollowersPresenterDelegate?
}

extension FollowersPresenter: FollowersInteractorDelegate {
	
	func interactorDidGet(result: Result<[Follower], FollowerNetworkError>) {
		
		switch result {
		case .failure(let error):
			delegate?.presenterDidGet(result: Result.failure(error))
		case .success(let followers):
			let followerViewModels = followers.map { follower -> FollowerViewModel in
				return FollowerViewModel(with: follower)
			}
			delegate?.presenterDidGet(result: Result.success(followerViewModels))
		}
	}
	
	func interactorDidGetAvatar(follower: Follower) {
		
		delegate?.presenterDidGetAvater(self, followerViewModel: FollowerViewModel(with: follower))
	}
}

