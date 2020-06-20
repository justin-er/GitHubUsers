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
	
	let user: UserViewModel
	
	
	init(user: UserViewModel) {
		self.user = user
		super.init(nibName: nil, bundle: nil)
	}
	 
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configViewController()
    }
	
	
	func configViewController() {
		
		view.addSubview(avatarImageView)
		view.addSubview(userNameLabel)
		view.addSubview(nameLabel)
		view.addSubview(locationImageView)
		view.addSubview(locationLable)
		view.addSubview(bioLabel)
		
		
	}
}
