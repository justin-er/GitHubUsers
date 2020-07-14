//
//  AEFollowerItemViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 06.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEFollowerItemInfoViewController: AEItemInfoViewController {
	
	weak var delegate: AEFollowerItemInfoViewControllerDelegate?
	
	override init(user: UserViewModel?) {
		
		super.init(user: user)
		config()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	func config() {
		
		itemInfoViewOne.title 	= "Following"
		itemInfoViewOne.image	= UIImage(systemName: "suit.heart")
		itemInfoViewOne.count	= user?.following ?? 0
		
		itemInfoViewTwo.title 	= "Followers"
		itemInfoViewTwo.image	= UIImage(systemName: "person.2")
		itemInfoViewTwo.count	= user?.followers ?? 0
		
		actionsButton.set(backgroundColor: .systemGreen, text: "Followers")
		
		actionsButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
	}
	
	@objc
	func didTapActionButton() {
		
		guard let user = user else { return }
		
		delegate?.followerItemViewControllerDidTapActionButton(self, user: user)
	}
	
	override var user: UserViewModel? {
		
		get { super.user }
		
		set {
			
			super.user = newValue
			self.itemInfoViewOne.count	= user?.following ?? 0
			self.itemInfoViewTwo.count	= user?.followers ?? 0
		}
	}
}

