//
//  UserInfoViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 16.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit
import SafariServices

class UserViewController: UIViewController {
	
	private let loadingViewProvider: LoadingViewProviderInput
	
	private var avatar: UIImage?
	
	private var interactor: UserInteractorInput
	private weak var followersViewControllerInput: FollowersViewControllerInput?
	
	private let alertViewProvider: AlertViewControllerProviderInput
	
	private var headerContentView 	= UIView()
	private var viewOne				= UIView()
	private var	viewTwo				= UIView()
	
	private let hMargin: CGFloat	= 16
	private let vMargin: CGFloat	= 16
	private let hPadding: CGFloat	= 16
	private let vPadding: CGFloat	= 16
	
	private let headerViewController 			= UserHeaderViewController(user: nil)
	private let repoItemViewConroller			= AERepoItemInfoViewController(user: nil)
	private let followerItemViewController		= AEFollowerItemInfoViewController(user: nil)
	private let createdAtLabel					= AEBodyLabel(textAlignment: .center)
	
	init(interactor: UserInteractorInput,
		 loadingViewProvider: LoadingViewProviderInput,
		 followersViewControllerInput: FollowersViewControllerInput,
		 alertViewProvider: AlertViewControllerProviderInput) {
		
		self.loadingViewProvider 			= loadingViewProvider
		self.followersViewControllerInput	= followersViewControllerInput
		self.interactor						= interactor
		self.alertViewProvider				= alertViewProvider
		
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
		configCreatedAtLabel()
		
		repoItemViewConroller.delegate 			= self
		followerItemViewController.delegate 	= self
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
	
	func configCreatedAtLabel() {
		
		createdAtLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(createdAtLabel)
		
		NSLayoutConstraint.activate([
			
			createdAtLabel.topAnchor.constraint(equalTo: viewTwo.bottomAnchor, constant: 16),
			createdAtLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
			createdAtLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
		])
	}
}
// MARK: - UserPresenterDelegate

extension UserViewController: UserPresenterDelegate {
	
	func presenterDidGet(result: Result<UserViewModel, UserNetworkError>) {
		
		loadingViewProvider.dismissLoading()
		
		switch result {
			
		case .failure(let userNetworkError):
			
			switch userNetworkError {
				
			case .invalidUsername:
				
				DispatchQueue.main.async {
					
					self.alertViewProvider.showAlert(presentingViewController: self, title: "Error", message: "Invalid username!", bottonTitle: "OK")
				}
				
			case .unableToComplete:
				
				DispatchQueue.main.async {
					
					self.alertViewProvider.showAlert(presentingViewController: self, title: "Error", message: "Unable to complete. Try again.", bottonTitle: "OK")
				}
				
			case .invalidAvatarUrl:
				
				DispatchQueue.main.async {
					
					self.alertViewProvider.showAlert(presentingViewController: self, title: "Error", message: "Invalid avatar URL.", bottonTitle: "OK")
				}
			}
			
		case .success(var userViewModel):
			
			if let avatar = self.avatar {
				
				userViewModel.avatar = avatar
				
			} else {
				
				let user = userViewModel.makeUser()
				interactor.getAvatar(user: user)
			}
			
			DispatchQueue.main.async {
				
				self.headerViewController.user = userViewModel
				
				self.viewOne.isHidden = false
				self.repoItemViewConroller.user = userViewModel
				
				self.viewTwo.isHidden = false
				self.followerItemViewController.user = userViewModel
				
				self.createdAtLabel.text = "Github since \(userViewModel.createdAt)"
			}
		}
	}
	
	func presenterDidGetAvatar(result: Result<UserViewModel, UserNetworkError>) {
		
		switch result {
			
		case .failure(let userNetworkError):
			
			switch userNetworkError {
				
			case .invalidUsername:
				
				DispatchQueue.main.async {
					
					self.alertViewProvider.showAlert(presentingViewController: self, title: "Error", message: "Invalid username!", bottonTitle: "OK")
				}
				
			case .unableToComplete:
				
				DispatchQueue.main.async {
					
					self.alertViewProvider.showAlert(presentingViewController: self, title: "Error", message: "Unable to complete. Try again.", bottonTitle: "OK")
				}
				
			case .invalidAvatarUrl:
				
				DispatchQueue.main.async {
					
					self.alertViewProvider.showAlert(presentingViewController: self, title: "Error", message: "Invalid avatar URL.", bottonTitle: "OK")
				}
			}
			
		case .success(let userViewModel):
			
			DispatchQueue.main.async {
				
				if let avatar = userViewModel.avatar {
					
					self.headerViewController.avatarImageView.image = avatar
				}
			}
		}
	}
}

extension UserViewController: AERepoItemInfoViewControllerDelegate {
	
	func repoItemInfoViewControllerDidTapActionButton(_: AERepoItemInfoViewController, user: UserViewModel) {
		
		guard let url = URL(string: user.htmlUrl) else { return }
		
		let safariViewController = SFSafariViewController(url: url)
		safariViewController.preferredControlTintColor = .systemGreen
		
		present(safariViewController, animated: true)
	}
}

extension UserViewController: AEFollowerItemInfoViewControllerDelegate {
	
	func followerItemViewControllerDidTapActionButton(_: AEFollowerItemInfoViewController, user: UserViewModel) {
		
		guard user.followers != 0 else {
			
			DispatchQueue.main.async {
				
				self.alertViewProvider.showAlert(presentingViewController: self, title: "No Followers", message: "This user has no followers 😞. That's a shame.", bottonTitle: "OK")
			}
			
			return
		}
		
		followersViewControllerInput?.representFollowers(ofUsername: user.login)
		dismiss(animated: true)
	}
}

extension UserViewController: UserViewControllerInput {
	
	func representUser(username: String, avatar: UIImage?) {
		
		headerViewController.userNameLabel.text = username
		self.avatar = avatar
		
		if let avatar = avatar {
			
			headerViewController.avatarImageView.image = avatar
		}
		
		loadingViewProvider.showLoading(on: self.view)
		interactor.getUser(username: username)
	}
	
}
