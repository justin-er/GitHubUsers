//
//  AEFollowerItemInfoViewControllerDelegate.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 08.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol AEFollowerItemInfoViewControllerDelegate: class {
	
	func followerItemViewControllerDidTapActionButton(_ :AEFollowerItemInfoViewController, user: UserViewModel)
}

