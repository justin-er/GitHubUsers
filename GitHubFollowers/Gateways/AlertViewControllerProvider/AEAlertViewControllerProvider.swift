//
//  AEAlertViewControllerProvider.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 11.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEAlertViewControllerProvider: AlertViewControllerProvider {
	
	var vc: AEAlertViewController?
	
	func showAlert(presentingViewController: UIViewController, title: String, message: String, bottonTitle: String) {
		
		vc = AEAlertViewController(title: title, message: message, buttonTitle: bottonTitle)
		presentingViewController.show(vc!, sender: vc!)
	}
	
	func dismiss() {
		
		guard let vc = vc else { return }
		vc.dismiss(animated: true)
	}
	
}

