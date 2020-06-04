//
//  ThreeColumnFlowLayout.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 21.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class ThreeColumnFlowLayout: UICollectionViewFlowLayout {
	
	override func prepare() {
		super.prepare()
		
		guard let cv = collectionView else { return }
		
		let width = cv.bounds.inset(by: cv.layoutMargins).size.width
		let padding: CGFloat 				= 12
		let minimumItemSpacing: CGFloat 	= 10
		let availableWidth 					= width - (2 * padding + 2 * minimumItemSpacing)
		let itemWidth 						= availableWidth / 3
		self.sectionInset 			= UIEdgeInsets(top: padding,
														   left: padding,
														   bottom: padding,
														   right: padding)
		self.itemSize 				= CGSize(width: itemWidth,
													 height: itemWidth + 40)
	}
}

