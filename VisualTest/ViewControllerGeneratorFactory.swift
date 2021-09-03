//
//  ViewControllerGeneratorFactory.swift
//  VisualTest
//
//  Created by Amirreza Eghtedari on 2021. 09. 03..
//  Copyright © 2021. Amirreza Eghtedari. All rights reserved.
//

import Foundation

struct ViewControllerGeneratorFactory {
    func build() -> [ViewControllerGenerator] {
        return [ViewControllerGenerator(title: "AEItemInfoView", generator: AEItemInfoViewContainerFactory.build())]
    }
}
