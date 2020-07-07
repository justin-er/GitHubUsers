//
//  AEFollowerItemViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 06.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEFollowerItemInfoViewController: AEItemInfoViewController {
	
	override init(user: UserViewModel?) {
		
		super.init(user: user)
		config()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	func config() {
		
		self.itemInfoViewOne.title 	= "Following"
		self.itemInfoViewOne.image	= UIImage(systemName: "suit.heart")
		self.itemInfoViewOne.count	= user?.following ?? 0
		
		self.itemInfoViewTwo.title 	= "Followers"
		self.itemInfoViewTwo.image	= UIImage(systemName: "person.2")
		self.itemInfoViewTwo.count	= user?.followers ?? 0
		
		self.actionsButton.set(backgroundColor: .systemGreen, text: "Get Followers")
	}
}

