//
//  ViewController.swift
//  VisualTest
//
//  Created by Amirreza Eghtedari on 2021. 09. 03..
//  Copyright © 2021. Amirreza Eghtedari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource = ViewControllerGeneratorFactory().build()
    let cellIdentifier = "basicTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Visual Tests"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) else {
            return UITableViewCell()
        }
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = dataSource[indexPath.row].title
        cell.contentConfiguration = configuration
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.dataSource[indexPath.row].generator()
        viewController.title = self.dataSource[indexPath.row].title
        self.show(viewController, sender: self)
    }
    
}

