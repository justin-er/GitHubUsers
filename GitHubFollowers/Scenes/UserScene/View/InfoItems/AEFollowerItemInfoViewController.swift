//
//  AEFollowerItemViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 06.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class AEFollowerItemInfoViewController: AEItemInfoViewController {
	
	override init(user: UserViewModel) {
		
		super.init(user: user)
		config()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	func config() {
		
		self.itemInfoViewOne.set(type: .follwers	, title: "Followers",	 count: user.followers ?? 0)
		self.itemInfoViewTwo.set(type: .following	, title: "Followings",	 count: user.following ?? 0)
		self.actionsButton.set(backgroundColor: .systemGreen, text: "Get Followers")
	}
}

