//
//  UIViewController+Extension.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 10/1/1399AP.
//  Copyright © 1399 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func presentAEAlert(title: String, message: String, buttonTitle: String) {
		DispatchQueue.main.async {
			let alert = AEAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
			self.present(alert, animated: true)
		}
    }
}
