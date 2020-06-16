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
	private var interactor: UserInteractorInput
	
	init(follower: FollowerViewModel, interactor: UserInteractorInput) {
		
		self.follower = follower
		self.interactor = interactor
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		title = follower.login
        configViewController()
		interactor.getUser(username: self.follower.login)
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
		}
	}
	
}
