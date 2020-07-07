//
//  AERepoItemInfoViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 06.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AERepoItemInfoViewController: AEItemInfoViewController {
	
	override init(user: UserViewModel?) {
		
		super.init(user: user)
		config()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	private func config() {
		
		self.itemInfoViewOne.title 	= "Public Repos"
		self.itemInfoViewOne.image	= UIImage(systemName: "folder")
		self.itemInfoViewOne.count	= user?.publicRepos ?? 0
		
		self.itemInfoViewTwo.title 	= "Public Gists"
		self.itemInfoViewTwo.image	= UIImage(systemName: "text.alignleft")
		self.itemInfoViewTwo.count	= user?.publicGists ?? 0
		
		self.actionsButton.set(backgroundColor: .systemPurple, text: "Github Profile")
	}
	
	override var user: UserViewModel? {
		
		get { super.user }
		
		set {
			
			super.user = newValue
			self.itemInfoViewOne.count	= user?.publicRepos ?? 0
			self.itemInfoViewTwo.count	= user?.publicGists ?? 0
		}
	}
}

