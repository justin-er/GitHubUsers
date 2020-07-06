//
//  AEItemInfoView.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 05.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEItemInfoView: UIView {
	
	let symbolImageView = UIImageView()
	let titleLabel 		= AETitleLabel(textAlignment: .center, fontSize: 16)
	let countLabel		= AETitleLabel(textAlignment: .center, fontSize: 16)
	
	override init(frame: CGRect) {
		
		super.init(frame: .zero)
		
		configView()
		configTitleLabel()
		configSymbolImageView()
		configCountLabel()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	func configView() {
		
		self.tintColor = UIColor.secondaryLabel
	}
	
	func configTitleLabel() {
		
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 751), for: .vertical)
		self.addSubview(titleLabel)
		
		let constraint01 = titleLabel.topAnchor.constraint(equalTo: self.topAnchor)
		let constraint02 = titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		
		NSLayoutConstraint.activate([
			
			constraint01,
			constraint02
		])
	}
	
	func configSymbolImageView() {
		
		symbolImageView.contentMode = .scaleAspectFill
		symbolImageView.translatesAutoresizingMaskIntoConstraints = false
		symbolImageView.tintColor = .label
		
		self.addSubview(symbolImageView)
		
		let constraint01	= symbolImageView.topAnchor.constraint(equalTo: self.topAnchor)
		let constraint02	= symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
		let constraint03	= symbolImageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -8)
		let constraint04	= symbolImageView.heightAnchor.constraint(equalTo: symbolImageView.widthAnchor)
		let constraint05	= symbolImageView.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)
		
		NSLayoutConstraint.activate([
		
			constraint01,
			constraint02,
			constraint03,
			constraint04,
			constraint05,
		])
	}
	
	func configCountLabel() {
		
		countLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(countLabel)
		
		NSLayoutConstraint.activate([
		
			countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 8),
			countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			countLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
	
	private func setImage(type: AEItemInfoViewType) {
		
		switch type {
			
		case AEItemInfoViewType.publicRepos:
			
			symbolImageView.image = UIImage(systemName: "folder")
		
		case .publicGists:
			
			symbolImageView.image = UIImage(systemName: "text.alignleft")
			
		case .following:
			
			symbolImageView.image = UIImage(systemName: "heart")
			
		case .follwers:
			
			symbolImageView.image = UIImage(systemName: "person.2")
		}
	}
	
	func set(type: AEItemInfoViewType, title: String, count: Int) {
		
		setImage(type: type)
		titleLabel.text = title
		countLabel.text = String(count)
	}
}
