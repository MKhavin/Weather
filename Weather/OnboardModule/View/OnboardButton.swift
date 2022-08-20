//
//  OnboardButton.swift
//  Weather
//
//  Created by Michael Khavin on 21.08.2022.
//

import UIKit

class OnboardButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tintColor = .white
        contentHorizontalAlignment = .trailing
        titleEdgeInsets = UIEdgeInsets(top: titleEdgeInsets.top,
                                              left: titleEdgeInsets.left,
                                              bottom: titleEdgeInsets.bottom,
                                              right: titleEdgeInsets.right + 5)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
