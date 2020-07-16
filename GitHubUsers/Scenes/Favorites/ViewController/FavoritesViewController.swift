//
//  FavoriteViewController.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 24/12/1398AP.
//  Copyright © 1398 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
	
	let interactor: FavoritesInteractorInput
	let userViewController: UserViewControllerInput
	
	var dataSource: AETableViewDiffableDataSource!
	let tableView = UITableView()
	
	var isVisible: Bool = false
	
//MARK:- Life Cycle and Config
	
	init(interactor: FavoritesInteractorInput, userViewController: UserViewControllerInput) {
		
		self.interactor 		= interactor
		self.userViewController = userViewController
		
		super.init(nibName: nil, bundle: nil)
		
		tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
	}
	
	override func viewDidLoad() {
        
		super.viewDidLoad()
		
		configViewController()
		configTableView()
		configDataSource()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
		interactor.getFavorites()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		
		super.viewDidAppear(animated)
		self.isVisible = true
	}

	override func viewDidDisappear(_ animated: Bool) {
		
		super.viewDidAppear(animated)
		self.isVisible = false
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configViewController() {
		
		view.backgroundColor = UIColor.secondarySystemBackground
		title = "Favorites"
	}
	
	private func configTableView() {
		
		tableView.delegate 	= self
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
	}
	
	func configDataSource() {
		
		dataSource = AETableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, index, userViewModel) -> UITableViewCell? in
			
			guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.reuseIdentifier) as? FavoriteTableViewCell else {
				
				return UITableViewCell()
			}
			
			if userViewModel.avatar == nil {
				
				self.interactor.getAvatar(for: userViewModel.makeUser())
			}
			
			cell.user = userViewModel
			
			return cell
		})
		
		dataSource.defaultRowAnimation = .fade
	}
}

//MARK:- UITableViewDelegate

extension FavoritesViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let userViewModel = dataSource.itemIdentifier(for: indexPath) else { return }
		
		userViewController.representUser(username: userViewModel.login, avatar: userViewModel.avatar)
		show(userViewController, sender: self)
	}

	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		
		let deleteActionHandler: UIContextualAction.Handler = { [weak self] (action, view, completion) in
			
			guard let self = self else {
				
				completion(false)
				return
			}
			
			guard let userViewModel = self.dataSource.itemIdentifier(for: indexPath) else {
				
				completion(false)
				return
			}
			
			self.interactor.deleteFavorite(user: userViewModel.makeUser())
			completion(true)
		}
		
		let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: deleteActionHandler)
		
		return UISwipeActionsConfiguration(actions: [deleteAction])
	}
}

//MARK:- FavoritesPresenterDelegate

extension FavoritesViewController: FavoritesPresenterDelegate {
	
	func presenterDidGet(_ presenter: FavoritesPresenterInput, favorites: [UserViewModel]?) {
		
		guard let favorites = favorites else {

			var snapshot = dataSource.snapshot()
			snapshot.deleteAllItems()
			dataSource.apply(snapshot, animatingDifferences: isVisible)

			return
		}

		var snapshop = NSDiffableDataSourceSnapshot<SectionType, UserViewModel>()
		snapshop.appendSections([SectionType.main])
		snapshop.appendItems(favorites)
		dataSource.apply(snapshop, animatingDifferences: isVisible)
	}
	
	func presenterDidGetAvatar(_ presenter: FavoritesPresenterInput, user: UserViewModel, result: Result<UIImage, AvatarNetworkError>) {
		
		switch result {
		
		case .success(let avatar):
			
			DispatchQueue.main.async { [weak self] in

				guard let self = self else { return }

				var snapshot = self.dataSource.snapshot()
				
				for userViewModel in snapshot.itemIdentifiers {

					if userViewModel == user {

						userViewModel.avatar = avatar
						snapshot.reloadItems([userViewModel])
						break
					}
				}

				self.dataSource.apply(snapshot, animatingDifferences: self.isVisible)
			}
	
		default:
			
			break
		}
	}

	func presenterDidDeleteFavorite(_ presenter: FavoritesPresenterInput, user: UserViewModel) {
		
		var snapshot = dataSource.snapshot()
		for item in snapshot.itemIdentifiers {

			if item == user {

				snapshot.deleteItems([item])
				break
			}
		}
		dataSource.apply(snapshot)
	}
}
