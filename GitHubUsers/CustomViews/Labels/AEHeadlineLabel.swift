//
//  AEHeadlineLabel.swift
//  GitHubFollowers
//
//  Created by Amirreza Eghtedari on 07.07.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEHeadlineLabel: UILabel {

    init(textAlignment: NSTextAlignment) {
		
		super.init(frame: .zero)
		
		self.textAlignment 				= textAlignment
		self.font 						= UIFont.preferredFont(forTextStyle: .headline)
		self.textColor 					= .label
		self.numberOfLines				= 1
		self.lineBreakMode				= .byTruncatingTail
		self.adjustsFontSizeToFitWidth	= true
		self.minimumScaleFactor			= 0.9
	}
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}

}
