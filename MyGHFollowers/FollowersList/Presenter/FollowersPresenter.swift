//
//  FollowersPresenter.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class FollowersPresenter: FollowersInteractorDelegate {
	
	weak var delegate: FollowersPresenterDelegate?
	
	func iteractorDidGet(result: Result<[Follower], FollowerNetworkError>) {
		
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
}

