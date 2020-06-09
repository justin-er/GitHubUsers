//
//  FollowersListViewController.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 29/12/1398AP.
//  Copyright © 1398 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {
	
	enum SectionType {
		case main
	}
    
	var interactor: FollowersInteractorInput!
	var collectionView: UICollectionView!
	var dataSource: UICollectionViewDiffableDataSource<SectionType, FollowerViewModel>!
	
    var username: String! {
        didSet {
            title = username
        }
    }
	
	deinit {
		print("SearchViewController did deinitialized!")
	}
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
		configViewConroller()
		configCollectionView()
		configDataSource()
		interactor.getFollowers(of: username)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
//        navigationController?.isNavigationBarHidden = false
//        navigationController?.navigationBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
	
	func configCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: ThreeColumnFlowLayout())
		collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		view.addSubview(collectionView)
		
		collectionView.backgroundColor = UIColor.systemBackground
		collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseIdentifier)
		
		collectionView.delegate = self
	}
	
	var firstItem = false
	
	func configDataSource() {
		dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { [weak self] (collectionView, indexPath, follower) -> UICollectionViewCell? in
			let followerCell = collectionView.dequeueReusableCell(
				withReuseIdentifier: FollowerCollectionViewCell.reuseIdentifier,
				for: indexPath) as? FollowerCollectionViewCell
			guard let cell = followerCell else { fatalError("Failed to dequeue cell!") }
			
			cell.setFollower(follower: follower)
			
			if follower.avatar == nil {
				self?.interactor.getAvatar(of: follower.makeFollower())
			}
			
			return cell
		})
	}
	
	func configViewConroller() {
		view.backgroundColor = UIColor.secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
	}
}

extension FollowersViewController: FollowersPresenterDelegate {
	
	enum CallbackType {
		case first, next
	}
	
	func presenterDidGetAvater(_ presenter: FollowersPresenterInput, followerViewModel: FollowerViewModel) {
		
		guard let _ = followerViewModel.avatar else { return }
		
		var snapshot = dataSource.snapshot()
		for follower in snapshot.itemIdentifiers {
			if follower.id == followerViewModel.id {
				follower.avatar = followerViewModel.avatar
				snapshot.reloadItems([follower])
				break
			}
		}
		
		dataSource.apply(snapshot)
	}
	
	fileprivate func processResult(_ result: Result<[FollowerViewModel], FollowerNetworkError>, type: CallbackType) {
		switch result {
		case .failure(let follwerError):
			switch follwerError {
			case .invalidUsername:
				self.presentAEAlert(title: "Error", message: "Invalid user name. Try again.", buttonTitle: "OK")
			case .unableToComplete:
				self.presentAEAlert(title: "Error", message: "Unable to complete. Try again.", buttonTitle: "OK")
			}
		case .success(let followers):
			switch type {
			case .first:
				var snapshot = NSDiffableDataSourceSnapshot<SectionType, FollowerViewModel>()
				snapshot.appendSections([SectionType.main])
				snapshot.appendItems(followers)
				self.dataSource.apply(snapshot)
			case .next:
				var snapshot = self.dataSource.snapshot()
				snapshot.appendItems(followers)
				self.dataSource.apply(snapshot)
			}
		}
	}
	
	func presenterDidGet(result: Result<[FollowerViewModel], FollowerNetworkError>) {
		
		processResult(result, type: .first)
	}
	
	func presenterDidGetNext(result: Result<[FollowerViewModel], FollowerNetworkError>) {
		
		processResult(result, type: .next)
	}
}

extension FollowersViewController: UICollectionViewDelegate {
	
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		
		let offsetY 		= scrollView.contentOffset.y
		let height 			= scrollView.bounds.height
		let contentHeight 	= scrollView.contentSize.height
		
		if offsetY + height >= contentHeight {
			if interactor.isMoreFollowers {
				interactor.getNextFollowers()
			}
		}
	}
}
