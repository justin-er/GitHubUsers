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
		interactor.getFollowers(of: username, pageNumber: 1)
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
	}
	
	var firstItem = false
	
	func configDataSource() {
		dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { [weak self] (collectionView, indexPath, follower) -> UICollectionViewCell? in

			
			let followerCell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseIdentifier,
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
	
	func presenterDidGetAvater(_ presenter: FollowersPresenterInput, followerViewModel: FollowerViewModel) {
		
		guard let _ = followerViewModel.avatar else { return }
		
		var snapshot = dataSource.snapshot()
		for follower in snapshot.itemIdentifiers {
			if follower.login == followerViewModel.login {
				follower.avatar = followerViewModel.avatar
				snapshot.reloadItems([follower])
				break
			}
		}
		
		dataSource.apply(snapshot)
	}
	
	func presenterDidGet(result: Result<[FollowerViewModel], FollowerNetworkError>) {
		switch result {
		case .failure(let follwerError):
			switch follwerError {
			case .invalidUsername:
				self.presentAEAlert(title: "Error", message: "Invalid user name. Try again.", buttonTitle: "OK")
			case .unableToComplete:
				self.presentAEAlert(title: "Error", message: "Unable to complete. Try again.", buttonTitle: "OK")
			}
		case .success(let followers):
			var snapshot = NSDiffableDataSourceSnapshot<SectionType, FollowerViewModel>()
			snapshot.appendSections([SectionType.main])
			snapshot.appendItems(followers)
			self.dataSource.apply(snapshot)
		}
	}
}
