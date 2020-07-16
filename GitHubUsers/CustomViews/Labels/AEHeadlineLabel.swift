//
//  AEHeadlineLabel.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 07.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEHeadlineLabel: UILabel {
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(frame: CGRect) {
		
		super.init(frame: .zero)
		
		self.font 							= UIFont.preferredFont(forTextStyle: .headline)
		adjustsFontForContentSizeCategory 	= true
		self.textColor 						= .label
		self.numberOfLines					= 1
		self.lineBreakMode					= .byTruncatingTail
		self.adjustsFontSizeToFitWidth		= true
		self.minimumScaleFactor				= 0.9
	}
	
    convenience init(textAlignment: NSTextAlignment) {
		
		self.init(frame: .zero)
		self.textAlignment 				= textAlignment
	}

}
