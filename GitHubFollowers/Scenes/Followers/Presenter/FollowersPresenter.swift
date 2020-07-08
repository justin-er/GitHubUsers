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
	
	var followerViewModels = [FollowerViewModel]()
	
	func filter(with filter: String) -> [FollowerViewModel] {
		
		guard !filter.isEmpty else { return followerViewModels }
		
		return followerViewModels.filter() { $0.login.lowercased().contains(filter.lowercased()) }
	}
	
	func cancelFilter() -> [FollowerViewModel] {
		
		return followerViewModels
	}
}

extension FollowersPresenter: FollowersInteractorDelegate {
	
	enum CallbackType {
		case first, next
	}
	
	fileprivate func processResult(_ result: Result<[Follower], FollowerNetworkError>, type: CallbackType) {
		switch result {
		case .failure(let error):
			delegate?.presenterDidGet(self, result: Result.failure(error))
		case .success(let followers):
			let newFollowerViewModels = followers.map { follower -> FollowerViewModel in
				return FollowerViewModel(with: follower)
			}
			switch type {
			case .first:
				followerViewModels.removeAll()
				followerViewModels.append(contentsOf: newFollowerViewModels)
				delegate?.presenterDidGet(self, result: Result.success(followerViewModels))
			case .next:
				followerViewModels.append(contentsOf: newFollowerViewModels)
				delegate?.presenterDidGetNext(self, result: Result.success(followerViewModels))
			}
		}
	}
	
	func interactroDidStartGettingFollowers(_: FollowersInteractorInput, of username: String) {
		
		delegate?.presenterDidStartGettingFollowers(self, of: username)
	}
	
	func interactorDidGet(_: FollowersInteractorInput, result: Result<[Follower], FollowerNetworkError>) {
		
		processResult(result, type: .first)
	}
	
	func interactroDidStartGettingNextFollowers(_: FollowersInteractorInput) {
		
		delegate?.presenterDidStartGettingNextFollowers(self)
	}
	
	func interactorDidGetNext(_: FollowersInteractorInput, result: Result<[Follower], FollowerNetworkError>) {
		
		processResult(result, type: .next)
	}
	
	func interactorDidGetAvatar(_: FollowersInteractorInput, follower: Follower) {
		
		delegate?.presenterDidGetAvater(self, followerViewModel: FollowerViewModel(with: follower))
	}
}

