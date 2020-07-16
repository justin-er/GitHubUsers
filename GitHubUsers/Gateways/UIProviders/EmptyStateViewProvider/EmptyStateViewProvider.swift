//
//  EmptyStateViewProvider.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class EmptyStateViewProvider: EmptyStateViewProviderInput {
	
	var contentView = UIView()
	var label 		= AETitleLabel(textAlignment: .center)
	var imageView 	= UIImageView(frame: .zero)
	
	init() {
		
		configLabel()
		configImageView()
	}
	
	private func configLabel() {
		
		label.numberOfLines	= 0
		label.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(label)
		
		NSLayoutConstraint.activate([
		
			label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
			label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
			label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
		])
	}
	
	private func configImageView() {
		
		imageView.image = Images.emptyStateLogo
		imageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(imageView)
		
		NSLayoutConstraint.activate([
			
			imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0),
			imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
			imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.3),
			imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.3)
		])
	}
	
	func configContentView(view: UIView) {
		
		contentView.backgroundColor = .systemBackground
		contentView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(contentView)
		
		NSLayoutConstraint.activate([
		
			contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	func showEmptyState(message: String, on view: UIView) {
		
		DispatchQueue.main.async { [weak self] in
			
			guard let self = self else { return }
			
			self.label.text = message
			self.configContentView(view: view)
		}
	}
	
	func dismissEmptyState() {
		
		contentView.removeFromSuperview()
	}
}
