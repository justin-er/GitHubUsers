//
//  FollowersListViewController.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 29/12/1398AP.
//  Copyright © 1398 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {
    
	var interactor: FolloweresInteractorInput!
	var collectionView: UICollectionView!
	
    var username: String! {
        didSet {
            title = username
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
		configCollectionView()
        configViewConroller()
		interactor.fetchFollowers(of: username, pageNumber: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
//        navigationController?.isNavigationBarHidden = false
//        navigationController?.navigationBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
	
	func configCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
		view.addSubview(collectionView)
		collectionView.backgroundColor = UIColor.systemPink
	}
	
	func configViewConroller() {
		view.backgroundColor = UIColor.secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
	}
}

extension FollowersViewController: FollowersPresenterDelegate {
	
	func presenterDidGet(followers: [FollowerViewModel]) {
		//Todo
	}
	
}
