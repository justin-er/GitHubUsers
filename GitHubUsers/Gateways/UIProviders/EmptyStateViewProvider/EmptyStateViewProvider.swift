//
//  EmptyStateViewProvider.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class EmptyStateViewProvider: EmptyStateViewProviderInput {
	
	var contentView: 	UIView
	var label: 			AETitleLabel
	var imageView: 		UIImageView
	
	init() {
		self.contentView = UIView()

		label 				= AETitleLabel(textAlignment: .center)
		label.numberOfLines	= 0
		imageView 			= UIImageView(frame: .zero)
		imageView.image 	= Images.emptyStateLogo
		
		label.translatesAutoresizingMaskIntoConstraints = false
		imageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.backgroundColor = .systemBackground
		self.contentView.addSubview(label)
		self.contentView.addSubview(imageView)
		
		NSLayoutConstraint.activate([
			label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -150),
			label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
			label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
			
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 40),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
			imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.3),
			imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.3)
		])
	}
	
	func showEmptyState(message: String, on view: UIView) {
		
		DispatchQueue.main.async { [weak self] in
			
			guard let self = self else { return }
			
			self.contentView.frame 		= view.bounds
			self.label.text 			= message
			
			view.addSubview(self.contentView)
		}
	}
	
	func dismissEmptyState() {
		
		contentView.removeFromSuperview()
	}
}
