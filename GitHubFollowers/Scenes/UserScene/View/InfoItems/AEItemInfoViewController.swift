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
	
	let padding: CGFloat = 20
	
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
		configStackView()
		configActionButton()
    }
	
	func configViewController() {
		
		view.layer.cornerRadius 	= 18
		view.backgroundColor 		= .secondarySystemBackground
	}
	
	func configStackView() {
		
		stackView.axis			= .horizontal
		stackView.distribution 	= .equalSpacing
		stackView.alignment		= .center
		
		itemInfoViewOne.translatesAutoresizingMaskIntoConstraints = false
		itemInfoViewTwo.translatesAutoresizingMaskIntoConstraints = false
		
		stackView.addArrangedSubview(itemInfoViewOne)
		stackView.addArrangedSubview(itemInfoViewTwo)
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(stackView)
		
		NSLayoutConstraint.activate([
		
			stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
			stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
			stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
		])
	}
	
	func configActionButton() {
		
		actionsButton.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(actionsButton)
		
		NSLayoutConstraint.activate([
		
			actionsButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: padding),
			actionsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
			actionsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			actionsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
			actionsButton.heightAnchor.constraint(equalToConstant: 44)
		])
	}
}
