//
//  AEButton.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13/12/1398AP.
//  Copyright © 1398 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class AEButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(backgroundColor: UIColor, text: String) {
        
        self.init(frame: .zero)
    
        self.backgroundColor = backgroundColor
        self.setTitle(text, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel?.textColor = .white
        backgroundColor = UIColor.tertiarySystemBackground
    }
	
	public func set(backgroundColor: UIColor, text: String) {
		
		self.backgroundColor = backgroundColor
        self.setTitle(text, for: .normal)
	}
}
