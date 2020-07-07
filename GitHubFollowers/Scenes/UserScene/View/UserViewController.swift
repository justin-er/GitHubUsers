//
//  UserInfoViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
	
	private let loadingViewProvider: LoadingViewProviderInput
	
	private var follower: FollowerViewModel
	private var persenter: UserPresenterInput
	
	private var headerContentView 	= UIView()
	private var viewOne				= UIView()
	private var	viewTwo				= UIView()
	
	private let hMargin: CGFloat	= 16
	private let vMargin: CGFloat	= 16
	private let hPadding: CGFloat	= 16
	private let vPadding: CGFloat	= 16
	
	private let headerViewController 			= UserHeaderViewControllerComposer.makeModule()
	private let repoItemViewConroller			= AERepoItemInfoViewController(user: nil)
	private let followerItemViewController		= AEFollowerItemInfoViewController(user: nil)
	
	init(follower: FollowerViewModel, presenter: UserPresenterInput, loadingViewProvider: LoadingViewProviderInput) {
		
		self.loadingViewProvider = loadingViewProvider
		
		self.follower = follower
		self.persenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
		
        super.viewDidLoad()
        configViewController()
		configHeaderContentView()
		configViewOne()
		configViewTwo()
		persenter.getUserDetail(of: self.follower)
		loadingViewProvider.showLoading(on: self.view)
	}
	
	private func add(childViewController: UIViewController, toContentView contentView: UIView) {
		
		addChild(childViewController)
		contentView.addSubview(childViewController.view)
		
		childViewController.view.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			childViewController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
			childViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			childViewController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			childViewController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
		
		childViewController.didMove(toParent: self)
	}
	
	func configHeaderContentView() {
		
		headerContentView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(headerContentView)
		
		NSLayoutConstraint.activate([
			
			headerContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: vMargin),
			headerContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: hMargin),
			headerContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -hMargin)
		])
		
		add(childViewController: headerViewController, toContentView : headerContentView)
		
		let tempUserViewModel = UserViewModel(login: follower.login,
		avatarUrl: follower.avatarUrl,
		name: "",
		location: "",
		bio: "",
		publicRepos: nil,
		publicGists: nil,
		htmlUrl: nil,
		following: nil,
		followers: nil,
		createdAt: nil,
		avatar: follower.avatar)
		
		headerViewController.user = tempUserViewModel
	}

	func configViewController() {
		
		self.view.backgroundColor = UIColor.systemBackground
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
		self.navigationItem.rightBarButtonItem = doneButton
	}
	
	@objc
	func doneButtonTapped() {
		
		self.dismiss(animated: true)
	}
	
	func configViewOne() {
		
		viewOne.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(viewOne)
		
		NSLayoutConstraint.activate([
			
			viewOne.topAnchor.constraint(equalTo: headerContentView.bottomAnchor, constant: hPadding),
			viewOne.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: vMargin),
			viewOne.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -vMargin)
		])
		
		self.add(childViewController: repoItemViewConroller, toContentView: self.viewOne)
		viewOne.isHidden = true
	}
	
	func configViewTwo() {
		
		viewTwo.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(viewTwo)
		
		NSLayoutConstraint.activate([
			
			viewTwo.topAnchor.constraint(equalTo: viewOne.bottomAnchor, constant: hPadding),
			viewTwo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: vMargin),
			viewTwo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -vMargin)
		])
		
		self.add(childViewController: followerItemViewController, toContentView: self.viewTwo)
		viewTwo.isHidden = true
	}
}

extension UserViewController: UserPresenterDelegate {
	
	func presenterDidGet(result: Result<UserViewModel, UserNetworkError>) {
		
		loadingViewProvider.dismissLoading()
		
		switch result {
			
		case .failure(let userNetworkError):
			
			switch userNetworkError {
				
			case .invalidUsername:
				
				self.presentAEAlert(title: "Error", message: "Ivalid username!", buttonTitle: "OK")
			
			case .unableToComplete:
				
				self.presentAEAlert(title: "Error", message: "Unable to complete. Try again.", buttonTitle: "OK")
			}
		case .success(let userViewModel):
			
			DispatchQueue.main.async {
				
				self.headerViewController.user = userViewModel
				
				self.viewOne.isHidden = false
				self.repoItemViewConroller.user = userViewModel
				
				self.viewTwo.isHidden = false
				self.followerItemViewController.user = userViewModel
			}
		}
	}
}
