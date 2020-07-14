//
//  FavoriteTableViewCell.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 13.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
	
	static var reuseIdentifier: String {
		String(describing: self)
	}
	
	private static let placeholderImage = UIImage(named: "Placeholder")

	let avatarImageView 	= AEAvatarImageView(frame: .zero)
	let usernameLabel 		= AEHeadlineLabel(textAlignment: .left)
	
	let padding 			= CGFloat(16)
	
//MARK:- Life Cycle and Config
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		configAvatarImageView()
		configUsernameLabel()
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
    override func awakeFromNib() {
        
		super.awakeFromNib()
		
        configAvatarImageView()
		configUsernameLabel()
    }
	
	func configAvatarImageView() {
		
		avatarImageView.image = Self.placeholderImage
		avatarImageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(avatarImageView)
		
		let top 		= avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
		let leading		= avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
		let bottom		= avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
		bottom.priority = UILayoutPriority(rawValue: 999)
		let width		= avatarImageView.widthAnchor.constraint(equalToConstant: 60)
		let height		= avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
		
		NSLayoutConstraint.activate([
			
			top, leading, bottom, width, height
		])
	}
	
	func configUsernameLabel() {
		
		usernameLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(usernameLabel)
		
		NSLayoutConstraint.activate([
		
			usernameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
			usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
			usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
		])
	}
	
	var user: UserViewModel? {
		
		didSet {
			
			self.usernameLabel.text = user?.login ?? ""
			
			if let avatarImage = user?.avatar {
				
				self.avatarImageView.image = avatarImage
			}
		}
	}
	
	override func prepareForReuse() {
		
		super.prepareForReuse()
		avatarImageView.image 	= Self.placeholderImage
		usernameLabel.text 		= ""
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
		
        super.setSelected(selected, animated: animated)
    }

}
