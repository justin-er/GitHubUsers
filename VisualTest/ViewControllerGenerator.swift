//
//  ViewControllerGenerator.swift
//  VisualTest
//
//  Created by Amirreza Eghtedari on 2021. 09. 03..
//  Copyright © 2021. Amirreza Eghtedari. All rights reserved.
//

import UIKit

struct ViewControllerGenerator {
    let title: String
    let generator: () -> UIViewController
    
    init(title: String, generator: @escaping @autoclosure () -> UIViewController) {
        self.title = title
        self.generator = generator
    }
}
