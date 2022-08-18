//
//  UIViewExtension.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { view in
            addSubview(view)
        }
    }
}
