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
	let userNameLabel			= AETitleLabel(textAlignment: .left)
	let nameLabel				= AESecondaryTitleLabel(textAlignment: .right)
	let locationImageView		= UIImageView(frame: .zero)
	let locationLable			= AESecondaryTitleLabel(textAlignment: .right)
	let bioLabel 				= AEBodyLabel(textAlignment: .left)
	
	let vMargin: CGFloat	= 0
	let hMargin: CGFloat	= 0
	let vPadding: CGFloat 	= 16
	let hPadding: CGFloat 	= 12
	
	init(user: UserViewModel?) {
		
		super.init(nibName: nil, bundle: nil)
		self.user = user
	}
	 
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
		
        super.viewDidLoad()
		
		addSubviews()
		configViewController()
		configAvatarImageView()
		configUserNameLabel()
		configNameLabel()
		configLocationImage()
		configLocationLabel()
		configBioLabel()
    }
	
	var user: UserViewModel? {
		
		didSet {
			
			guard let user = user else { return }
			
			if let avatar = user.avatar {
				
				self.avatarImageView.image = avatar
				
			} else {
				
				avatarImageView.image = Images.placeholder
			}
			
			userNameLabel.text 		= user.login
			nameLabel.text 			= user.name
			locationLable.text 		= user.location ?? "No Location"
			bioLabel.text 			= user.bio ?? "No bio available"
			
			locationImageView.image 		= Images.location
			locationImageView.tintColor 	= .secondaryLabel
		}
	}
	
	func addSubviews() {
		
		view.addSubview(avatarImageView)
		view.addSubview(userNameLabel)
		view.addSubview(nameLabel)
		view.addSubview(locationImageView)
		view.addSubview(locationLable)
		view.addSubview(bioLabel)
	}
	
	func configViewController() {
		
		view.backgroundColor = UIColor.systemBackground
	}
	
	func configAvatarImageView() {
		
		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			avatarImageView.widthAnchor.constraint(equalToConstant: 100),
			avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
			avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: hMargin),
			avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: vMargin)
		])
	}
	
	func configUserNameLabel() {
		
		userNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			userNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
			userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: hPadding),
			userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hMargin)
		])
	}
	
	func configNameLabel() {
		
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
			nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: hPadding),
			nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hMargin)
		])
	}
	
	func configLocationImage() {
		
		locationImageView.contentMode = .scaleAspectFit
		locationImageView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			locationImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
			locationImageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
			locationImageView.heightAnchor.constraint(equalTo: locationLable.heightAnchor),
			locationImageView.widthAnchor.constraint(equalToConstant: 20)
		])
	}
	
	func configLocationLabel() {
		
		locationLable.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			locationLable.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
			locationLable.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
			locationLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hMargin)
		])
	}
	
	func configBioLabel() {
	
		bioLabel.numberOfLines 	= 3
		bioLabel.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			bioLabel.topAnchor.constraint(equalTo: locationLable.bottomAnchor, constant: vPadding),
			bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
			bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -hMargin),
			bioLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -hMargin)
		])
	}
}
