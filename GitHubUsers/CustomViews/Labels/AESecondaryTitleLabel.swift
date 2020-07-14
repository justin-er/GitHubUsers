//
//  AETitleLabel.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 6/1/1399AP.
//  Copyright © 1399 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AESecondaryTitleLabel: UILabel {

    required init?(coder: NSCoder) {
        fatalError("This control should not be used in Storyboads!")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
	convenience init(textAlignment: NSTextAlignment) {
        
        self.init(frame: .zero)

		self.font = UIFont.preferredFont(forTextStyle: .title3)
        textColor = UIColor.secondaryLabel
        lineBreakMode = .byTruncatingTail
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
    }

}
