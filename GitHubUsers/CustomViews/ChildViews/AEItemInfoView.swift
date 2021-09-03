//
//  AEItemInfoView.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 05.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEItemInfoView: UIView {
	
	private let symbolImageView = UIImageView()
	private let titleLabel 		= AEHeadlineLabel(textAlignment: .center)
	private let countLabel		= AEHeadlineLabel(textAlignment: .center)
	
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
		
		titleLabel.text = "Lorem Ipsum"
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
		
		symbolImageView.image 		= Images.folder
		symbolImageView.contentMode = .scaleAspectFill
		symbolImageView.translatesAutoresizingMaskIntoConstraints = false
		symbolImageView.tintColor 	= .label
		
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
		
		countLabel.text = "0"
		countLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(countLabel)
		
		NSLayoutConstraint.activate([
		
			countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 8),
			countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			countLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
	
	public var title: String? {
		
		set {
			
			titleLabel.text = newValue
		}
		
		get {
			
			return titleLabel.text
		}
	}
	
	public var image: UIImage? {
		
		set {
			
			symbolImageView.image = newValue
		}
		
		get {
			
			return symbolImageView.image
		}
	}
	
	public var count: Int? {
		
		set {
			
			countLabel.text = String(newValue ?? 0)
		}
		
		get {
			
			return Int(countLabel.text ?? "0")
		}
	}
}
