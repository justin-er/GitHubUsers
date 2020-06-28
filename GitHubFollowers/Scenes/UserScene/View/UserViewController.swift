//
//  UserInfoViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
	
	private var follower: FollowerViewModel
	private var persenter: UserPresenterInput
	private var headerContentView = UIView()
	
	private let headerViewController = UserHeaderViewControllerComposer.makeModule()
	
	init(follower: FollowerViewModel, presenter: UserPresenterInput) {
		
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
		persenter.getUserDetail(of: self.follower)
	}
	
	func configHeaderContentView() {
		
		headerContentView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(headerContentView)
		
		NSLayoutConstraint.activate([
			headerContentView.topAnchor.constraint(equalTo: view.topAnchor),
			headerContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			headerContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
		
		addChild(headerViewController)
		headerContentView.addSubview(headerViewController.view)
		
		headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			headerViewController.view.topAnchor.constraint(equalTo: headerContentView.topAnchor),
			headerViewController.view.bottomAnchor.constraint(equalTo: headerContentView.bottomAnchor),
			headerViewController.view.leadingAnchor.constraint(equalTo: headerContentView.leadingAnchor),
			headerViewController.view.trailingAnchor.constraint(equalTo: headerContentView.trailingAnchor)
		])
		
		headerViewController.didMove(toParent: self)
		
		let tempUserViewModel = UserViewModel(login: follower.login,
		avatarUrl: follower.avatarUrl,
		name: nil,
		location: nil,
		bio: nil,
		publicRepos: nil,
		publicGists: nil,
		htmlUrl: nil,
		following: nil,
		followers: nil,
		createdAt: nil,
		avatar: follower.avatar)
		
		headerViewController.updateUI(user: tempUserViewModel)
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

}

extension UserViewController: UserPresenterDelegate {
	
	func presenterDidGet(result: Result<UserViewModel, UserNetworkError>) {
		
		switch result {
			
		case .failure(let userNetworkError):
			
			switch userNetworkError {
				
			case .invalidUsername:
				
				self.presentAEAlert(title: "Error", message: "Ivalid username!", buttonTitle: "OK")
			
			case .unableToComplete:
				
				self.presentAEAlert(title: "Error", message: "Unable to complete. Try again.", buttonTitle: "OK")
			}
		case .success(let userViewModel):
			print(userViewModel)
			headerViewController.updateUI(user: userViewModel)
		}
	}
	
}
