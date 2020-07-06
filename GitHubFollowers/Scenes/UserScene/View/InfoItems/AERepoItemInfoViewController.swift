//
//  AERepoItemInfoViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 06.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class AERepoItemInfoViewController: AEItemInfoViewController {
	
	override init(user: UserViewModel) {
		
		super.init(user: user)
		config()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	func config() {
		
		self.itemInfoViewOne.set(type: .publicRepos, title: "Public Repos", count: user.publicRepos ?? 0)
		self.itemInfoViewTwo.set(type: .publicGists, title: "Public Gists", count: user.publicGists ?? 0)
		self.actionsButton.set(backgroundColor: .systemPurple, text: "Github Profile")
	}
}

