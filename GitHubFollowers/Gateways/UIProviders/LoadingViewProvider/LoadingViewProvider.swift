//
//  LoadingViewProvider.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class LoadingViewProvider: LoadingViewProviderInput {
	
	weak var view: 			UIView?
	var loadingView: 		UIView
	
	init() {
		loadingView = UIView()
	}
	
	
	func showLoading(on view: UIView) {
		
		DispatchQueue.main.async { [weak self] in
			
			guard let self = self else { return }
			
			self.view = view
			
			self.loadingView.frame				= view.bounds
			self.loadingView.backgroundColor 	= UIColor.systemBackground
			self.loadingView.alpha 				= 0
			
			let activityIndicator = UIActivityIndicatorView(style: .large)
			activityIndicator.startAnimating()
			self.loadingView.addSubview(activityIndicator)
			activityIndicator.translatesAutoresizingMaskIntoConstraints = false
			NSLayoutConstraint.activate([
				activityIndicator.centerXAnchor.constraint(equalTo: self.loadingView.centerXAnchor),
				activityIndicator.centerYAnchor.constraint(equalTo: self.loadingView.centerYAnchor)
			])
			
			view.addSubview(self.loadingView)
			UIView.animate(withDuration: 0.25) {
				self.loadingView.alpha = 0.9
			}
		}
	}
	
	func dismissLoading() {
		DispatchQueue.main.async {
			self.loadingView.removeFromSuperview()
		}
	}
	
}
