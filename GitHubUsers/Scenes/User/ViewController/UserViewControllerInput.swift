//
//  UserViewControllerInput.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 12.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

protocol UserViewControllerInput: UIViewController {
	
	func representUser(username: String, avatar: UIImage?)
}

