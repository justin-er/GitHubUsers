//
//  AEBodyLabel.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 6/1/1399AP.
//  Copyright © 1399 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEBodyLabel: UILabel {

    required init?(coder: NSCoder) {
        fatalError("This control should not be used in Storyboads!")
    }

    override init(frame: CGRect) {
        
		super.init(frame: frame)
		
		font 								= UIFont.preferredFont(forTextStyle: .body)
		adjustsFontForContentSizeCategory 	= true
        textColor 							= UIColor.secondaryLabel
		lineBreakMode 						= .byTruncatingTail
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        
    }
}
