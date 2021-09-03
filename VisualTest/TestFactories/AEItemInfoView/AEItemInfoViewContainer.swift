//
//  AEItemInfoViewContainer.swift
//  VisualTest
//
//  Created by Amirreza Eghtedari on 2021. 09. 03..
//  Copyright © 2021. Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEItemInfoViewContainer: UIViewController {

    let sut = AEItemInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        self.sut.count = 100
        self.sut.title = "Amirreza Eghtedari Amirreza Eghtedari Amirreza Eghtedari"
//        self.sut.image = UIImage(systemName: <#T##String#>)

        sut.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sut)
        
        NSLayoutConstraint.activate([
            self.sut.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            self.sut.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            self.sut.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32)
        ])
    }

}
