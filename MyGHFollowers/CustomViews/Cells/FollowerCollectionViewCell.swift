//
//  FollowerCollectionViewCell.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 05.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    
	static var reuseIdentifier: String {
		String(describing: self)
	}
	
	let avatarImageView = AEAvatarImageView(frame: .zero)
	let usernameLabel	= AETitleLabel(textAlignment: .center, fontSize: 16)
	let padding: CGFloat = 8
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		config()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setFollower(follower: FollowerViewModel) {
		usernameLabel.text = follower.login
		if let avatar = follower.avatar {
			switch avatar {
			case .data(let imageData):
				self.avatarImageView.image = UIImage(data: imageData)
			case .image(let imageObject):
				self.avatarImageView.image = imageObject as? UIImage
			}
		}
	}
	
	func config() {	
		addSubview(avatarImageView)
		addSubview(usernameLabel)
		
		NSLayoutConstraint.activate([
			avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
			avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
			
			usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
			usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			usernameLabel.heightAnchor.constraint(equalToConstant: 20)
		])
	}
}
