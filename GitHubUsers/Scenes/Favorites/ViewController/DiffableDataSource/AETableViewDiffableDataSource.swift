//
//  AETableViewDiffableDataSource.swift
//  GitHubUsers
//
//  Created by Amirreza Eghtedari on 14.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AETableViewDiffableDataSource: UITableViewDiffableDataSource<SectionType, UserViewModel> {
		
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
}

