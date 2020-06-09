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
	
	enum CallbackType {
		case first, next
	}
	
	fileprivate func processResult(_ result: Result<[Follower], FollowerNetworkError>, type: CallbackType) {
		switch result {
		case .failure(let error):
			delegate?.presenterDidGet(result: Result.failure(error))
		case .success(let followers):
			let followerViewModels = followers.map { follower -> FollowerViewModel in
				return FollowerViewModel(with: follower)
			}
			switch type {
			case .first:
				delegate?.presenterDidGet(result: Result.success(followerViewModels))
			case .next:
				delegate?.presenterDidGetNext(result: Result.success(followerViewModels))
			}
		}
	}
	
	func interactorDidGet(result: Result<[Follower], FollowerNetworkError>) {
		
		processResult(result, type: .first)
	}
	
	func interactorDidGetNext(result: Result<[Follower], FollowerNetworkError>) {
		
		processResult(result, type: .next)
	}
	
	func interactorDidGetAvatar(follower: Follower) {
		
		delegate?.presenterDidGetAvater(self, followerViewModel: FollowerViewModel(with: follower))
	}
}

