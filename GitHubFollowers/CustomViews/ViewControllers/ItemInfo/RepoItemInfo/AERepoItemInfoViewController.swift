//
//  AERepoItemInfoViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 06.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AERepoItemInfoViewController: AEItemInfoViewController {
	
	var delegate: AERepoItemInfoViewControllerDelegate?
	
	override init(user: UserViewModel?) {
		
		super.init(user: user)
		config()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	private func config() {
		
		itemInfoViewOne.title 	= "Public Repos"
		itemInfoViewOne.image	= UIImage(systemName: "folder")
		itemInfoViewOne.count	= user?.publicRepos ?? 0
		
		itemInfoViewTwo.title 	= "Public Gists"
		itemInfoViewTwo.image	= UIImage(systemName: "text.alignleft")
		itemInfoViewTwo.count	= user?.publicGists ?? 0
		
		actionsButton.set(backgroundColor: .systemPurple, text: "Github Profile")
		
		actionsButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
	}
	
	@objc
	func didTapActionButton() {
		
		guard let user = user else { return }
		
		delegate?.repoItemInfoViewControllerDidTapActionButton(self, user: user)
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

