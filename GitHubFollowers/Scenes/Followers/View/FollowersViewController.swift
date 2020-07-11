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
    
	private var interactor: 				FollowersInteractorInput
	private var loadingViewProvider: 		LoadingViewProviderInput
	private let presenter:					FollowersPresenterInput
	private var emptyStateViewProvider:		EmptyStateViewProviderInput
	private var alertViewProvider:			AlertViewControllerProviderInput
	
	var collectionView: 	UICollectionView!
	var dataSource: 		UICollectionViewDiffableDataSource<SectionType, FollowerViewModel>!
	
    var username: String! {
        didSet {
            title = username
        }
    }
	
	init(followersInteractor: FollowersInteractorInput, loadingViewProvider: LoadingViewProviderInput, presenter: FollowersPresenterInput, emptyStateViewProvider: EmptyStateViewProviderInput, alertViewProvider: AlertViewControllerProviderInput) {
		
		self.interactor 				= followersInteractor
		self.loadingViewProvider 		= loadingViewProvider
		self.emptyStateViewProvider 	= emptyStateViewProvider
		self.presenter 					= presenter
		self.alertViewProvider			= alertViewProvider
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	deinit {
		
	}
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
		configViewConroller()
		configSearchBar()
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
	
	func configSearchBar() {
		
		let searchController = UISearchController()
		searchController.searchResultsUpdater = self
		searchController.searchBar.delegate = self
		searchController.obscuresBackgroundDuringPresentation = false
		navigationItem.searchController = searchController
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
		
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
		navigationItem.rightBarButtonItem = addButton
	}
	
	@objc
	func addButtonTapped() {
		
		print("add button tapped!")
	}
}

extension FollowersViewController: FollowersPresenterDelegate {
	
	enum CallbackType {
		case first, next
	}
	
	func presenterDidGetAvater(_ presenter: FollowersPresenterInput, followerViewModel: FollowerViewModel) {
		
		DispatchQueue.main.async { [weak self] in
			guard let self = self else { return }
			guard let _ = followerViewModel.avatar else { return }
			
			var snapshot = self.dataSource.snapshot()
			for follower in snapshot.itemIdentifiers {
				if follower.id == followerViewModel.id {
					follower.avatar = followerViewModel.avatar
					snapshot.reloadItems([follower])
					break
				}
			}
			
			self.dataSource.apply(snapshot)
		}
	}
	
	fileprivate func processResult(_ result: Result<[FollowerViewModel], FollowerNetworkError>, type: CallbackType) {
		
		switch result {
		
		case .failure(let follwerError):
			
			switch follwerError {
			
			case .invalidUsername:
				
				DispatchQueue.main.async {
					
					self.alertViewProvider.showAlert(presentingViewController: self, title: "Error", message: "Invalid user name. Try again.", bottonTitle: "OK")
				}
			
			case .unableToComplete:
				
				DispatchQueue.main.async {
					
					self.alertViewProvider.showAlert(presentingViewController: self, title: "Error", message: "Unable to complete. Try again.", bottonTitle: "OK")
				}
			}
		
		case .success(let followers):
			
			switch type {
			
			case .first, .next:
				
				updateUI(followers: followers, emptyStateMessage: "There is no follower")
			}
		}
	}
	
	private func updateUI(followers: [FollowerViewModel], emptyStateMessage: String) {
		
		if followers.isEmpty {
			DispatchQueue.main.async { [weak self] in
				guard let self = self else { return }
				var snapshot = self.dataSource.snapshot()
				snapshot.deleteAllItems()
				self.dataSource.apply(snapshot)
				
				self.emptyStateViewProvider.showEmptyState(message: emptyStateMessage, on: self.view)
			}
			return
		}
		
		DispatchQueue.main.async {
			self.emptyStateViewProvider.dismissEmptyState()
			var snapshot = NSDiffableDataSourceSnapshot<SectionType, FollowerViewModel>()
			snapshot.appendSections([SectionType.main])
			snapshot.appendItems(followers)
			self.dataSource.apply(snapshot)
		}
	}
	
	func presenterDidStartGettingFollowers(_ presenter: FollowersPresenterInput, of username: String) {
		
		self.username = username
		loadingViewProvider.showLoading(on: view)
	}
	
	func presenterDidGet(_: FollowersPresenterInput, result: Result<[FollowerViewModel], FollowerNetworkError>) {
		
		self.loadingViewProvider.dismissLoading()
		processResult(result, type: .first)
	}
	
	func presenterDidStartGettingNextFollowers(_ presenter: FollowersPresenterInput) {
		
		loadingViewProvider.showLoading(on: view)
	}
	
	func presenterDidGetNext(_: FollowersPresenterInput, result: Result<[FollowerViewModel], FollowerNetworkError>) {
		
		self.loadingViewProvider.dismissLoading()
		processResult(result, type: .next)
	}
}

extension FollowersViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		guard let selectedViewModel = self.dataSource.itemIdentifier(for: indexPath) else { return }
		let userNavigationController = UserNavigationControllerComposer.makeModule(follower: selectedViewModel,
																				   followersInteractorInput: interactor)
		present(userNavigationController, animated: true)
	}
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		
		let offsetY 		= scrollView.contentOffset.y
		let height 			= scrollView.frame.height
		let contentHeight 	= scrollView.contentSize.height
		
		if offsetY + height >= contentHeight {
			if interactor.isMoreFollowers {
				loadingViewProvider.showLoading(on: self.view)
				interactor.getNextFollowers()
			}
		}
	}
	
	func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		
		let offsetY 		= scrollView.contentOffset.y
		let height 			= scrollView.frame.height
		let contentHeight 	= scrollView.contentSize.height
		
		if offsetY + height >= contentHeight && !decelerate {
			if interactor.isMoreFollowers {
				loadingViewProvider.showLoading(on: self.view)
				interactor.getNextFollowers()
			}
		}
	}
}

extension FollowersViewController: UISearchResultsUpdating {
	
	func updateSearchResults(for searchController: UISearchController) {
		
		guard let filter = searchController.searchBar.text, !filter.isEmpty else {
			let followers = presenter.cancelFilter()
			updateUI(followers: followers, emptyStateMessage: "There is no follower")
			return
		}
		
		let followers = presenter.filter(with: filter)
		updateUI(followers: followers, emptyStateMessage: "No matching follower!")
	}
}

extension FollowersViewController: UISearchBarDelegate {
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
	
		let followers = presenter.cancelFilter()
		updateUI(followers: followers, emptyStateMessage: "There is no follower")
	}
}

