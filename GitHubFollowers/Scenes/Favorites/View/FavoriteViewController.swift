//
//  FavoriteViewController.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 24/12/1398AP.
//  Copyright © 1398 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
	
	init() {
		
		super.init(nibName: nil, bundle: nil)
		
		title = "Favorite"
        tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        view.backgroundColor = UIColor.secondarySystemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
