//
//  UIColorExtension.swift
//  Weather
//
//  Created by Michael Khavin on 19.08.2022.
//

import UIKit

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255.0,
              green: green/255.0,
              blue: blue/255.0,
              alpha: 1)
    }
}
