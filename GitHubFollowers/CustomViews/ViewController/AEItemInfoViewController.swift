//
//  AEItemInfoViewController.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 06.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEItemInfoViewController: UIViewController {

	let itemInfoViewOne = AEItemInfoView()
	let itemInfoViewTwo = AEItemInfoView()
	let stackView		= UIStackView()
	let actionsButton	= AEButton()
	
	let padding: CGFloat = 16
	
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
		configItemInfoViewOne()
		configItemInfoViewTwo()
		configStackView()
		configActionButton()
    }
	
	func configViewController() {
		
		view.layer.cornerRadius 	= 18
		view.backgroundColor 		= .secondarySystemBackground
	}
	
	func configItemInfoViewOne() {
		
		itemInfoViewOne.translatesAutoresizingMaskIntoConstraints = false
	}
	
	func configItemInfoViewTwo() {
		
		itemInfoViewTwo.translatesAutoresizingMaskIntoConstraints = false
	}
	
	func configStackView() {
		
		stackView.axis			= .horizontal
		stackView.distribution 	= .equalSpacing
		stackView.alignment		= .center
		
		stackView.addArrangedSubview(itemInfoViewOne)
		stackView.addArrangedSubview(itemInfoViewTwo)
		
		NSLayoutConstraint.activate([
		
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		])
	}
	
	func configActionButton() {
		
		NSLayoutConstraint.activate([
		
			actionsButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: padding),
			actionsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
			actionsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			actionsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
		])
	}
}
