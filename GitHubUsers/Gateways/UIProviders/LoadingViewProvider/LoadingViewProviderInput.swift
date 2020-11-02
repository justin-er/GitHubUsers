//
//  LoadingViewProviderInput.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

protocol LoadingViewProviderInput {
	
	func showLoading(on view: UIView)
	
	func dismissLoading()
}
