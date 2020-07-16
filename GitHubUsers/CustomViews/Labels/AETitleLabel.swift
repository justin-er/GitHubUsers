//
//  AETitleLabel2.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 07.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AETitleLabel: UILabel {
	
	override init(frame: CGRect) {
		
		super.init(frame: .zero)
		
		self.font 						= UIFont.preferredFont(forTextStyle: .title1)
		self.textColor 					= .label
		self.numberOfLines				= 1
		self.lineBreakMode				= .byTruncatingTail
		self.adjustsFontSizeToFitWidth	= true
		self.minimumScaleFactor			= 0.9
	}
	
	convenience init(textAlignment: NSTextAlignment) {
		
		self.init(frame: .zero)
		self.textAlignment 				= textAlignment
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
}
