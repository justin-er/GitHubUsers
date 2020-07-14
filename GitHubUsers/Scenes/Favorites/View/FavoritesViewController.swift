//
//  FavoriteViewController.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 24/12/1398AP.
//  Copyright © 1398 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
	
	enum SectionType {
		
		case main
	}
	
	let interactor: FavoritesInteractorInput
	
	var dataSource: UITableViewDiffableDataSource <SectionType, UserViewModel>!
	let tableView = UITableView()
	
//MARK:- Life Cycle and Config
	
	init(interactor: FavoritesInteractorInput) {
		
		self.interactor 	= interactor
		super.init(nibName: nil, bundle: nil)
		
		tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
	}
	
	override func viewDidLoad() {
        
		super.viewDidLoad()
		
		configViewController()
		configTableView()
		configTableViewDatasource()
		configDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
		
        super.viewWillAppear(animated)
		
        navigationController?.setNavigationBarHidden(false, animated: true)
		interactor.getFavorites()
    }
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configViewController() {
		
		view.backgroundColor = UIColor.secondarySystemBackground
		title = "Favorites"
	}
	
	private func configTableView() {
		
		tableView.register(FavoriteTableViewCell.self,
						   forCellReuseIdentifier: FavoriteTableViewCell.reuseIdentifier)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tableView)
		
		NSLayoutConstraint.activate([
		
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
		
		tableView.delegate 		= self
	}
	
	func configDataSource() {
		
		dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, index, userViewModel) -> UITableViewCell? in
			
			guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.reuseIdentifier) as? FavoriteTableViewCell else {
				
				return UITableViewCell()
			}
			
			cell.user = userViewModel
			
			return cell
		})
	}
}

//MARK:- TableViwe Data Source

func configTableViewDatasource() {
	
	
}

//MARK:- UITableViewDelegate

extension FavoritesViewController: UITableViewDelegate {
	
}

//MARK:- FavoritesPresenterDelegate

extension FavoritesViewController: FavoritesPresenterDelegate {
	
	func presenterDidGet(_ presenter: FavoritesPresenterInput, favorites: [UserViewModel]?) {
		
		guard let favorites = favorites else {
			
			var snapshop = dataSource.snapshot()
			snapshop.deleteAllItems()
			dataSource.apply(snapshop)
			
			return
		}
		
		var snapshop = NSDiffableDataSourceSnapshot<SectionType, UserViewModel>()
		snapshop.appendSections([SectionType.main])
		snapshop.appendItems(favorites)
		dataSource.apply(snapshop)
	}
}
