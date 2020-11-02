//
//  StringAnalyzer.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 09.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class StringAnalyzer: StringAnalyzerInput {
	
	func lookFor(key: String, value: String, in string: String) -> Bool {
		
		guard let range = string.range(of: key) else { return false }
		
		let lastIndex = string.index(range.upperBound, offsetBy: 6, limitedBy: string.endIndex)
		guard let endIndex = lastIndex else { return false }
		
		let result = string[range.upperBound..<endIndex]
		if result == value {
			return true
		} else {
			let suffix = string.suffix(from: endIndex)
			return lookFor(key: key, value: value, in: String(suffix))
		}
	}
}
