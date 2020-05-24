//
//  AEImageView.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 05.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEAvatarImageView: UIImageView {

	static let placeholderImage = UIImage(named: "Placeholder")
		
	override init(frame: CGRect) {
		super.init(frame: frame)
		config()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func config() {
		self.image = AEAvatarImageView.placeholderImage
		layer.cornerRadius = 10
		clipsToBounds = true
		translatesAutoresizingMaskIntoConstraints = false
	}
}
