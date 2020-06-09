//
//  StringAnalyzerInput.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 09.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol StringAnalyzerInput {
	
	func lookFor(prefix: String, value: String, in string: String) -> Bool
}
