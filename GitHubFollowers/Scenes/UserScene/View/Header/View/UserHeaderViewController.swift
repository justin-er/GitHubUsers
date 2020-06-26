//
//  UserHeaderViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 17.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class UserHeaderViewController: UIViewController {

	let avatarImageView 		= AEAvatarImageView(frame: .zero)
	let userNameLabel			= AETitleLabel(textAlignment: .left, fontSize: 34.0)
	let nameLabel				= AESecondaryTitleLabel(fontSize: 18)
	let locationImageView		= UIImageView(frame: .zero)
	let locationLable			= AESecondaryTitleLabel(fontSize: 18)
	let bioLabel 				= AEBodyLabel(textAlignment: .left)
	
	let vPadding: CGFloat = 16
	let hPadding: CGFloat = 12
	
	init(user: UserHeaderViewModel) {
		
		super.init(nibName: nil, bundle: nil)
		updateUI(user: user)
	}
	 
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
		
        super.viewDidLoad()
		configViewController()
		configAvatarImageView()
		configuserNameLabel()
    }
	
	func updateUI(user: UserHeaderViewModel) {
		
		switch user.avater {
			
		case let .data(data):
			guard let image = UIImage(data: data) else {
				
				avatarImageView.image = UIImage(named: "Placeholder")
				break
			}
			
			avatarImageView.image = image
		
		case let .image(any):
			guard let image = any as? UIImage else {
				
				avatarImageView.image = UIImage(named: "Placeholder")
				break
			}
			
			avatarImageView.image = image

		case .none:
			avatarImageView.image = UIImage(named: "Placeholder")
		}
		
		userNameLabel.text = user.login
	}
	
	func configViewController() {
		
		view.backgroundColor = UIColor.systemBackground
	}
	
	func configAvatarImageView() {
		
		view.addSubview(avatarImageView)
		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			avatarImageView.widthAnchor.constraint(equalToConstant: 120),
			avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
			avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: hPadding),
			avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: vPadding),
			avatarImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -hPadding)
		])
	}
	
	func configuserNameLabel() {
		
		view.addSubview(userNameLabel)
		userNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			userNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
			userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: hPadding),
			userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hPadding)
		])
	}
}
