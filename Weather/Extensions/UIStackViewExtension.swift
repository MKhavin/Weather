//
//  UIStackViewExtension.swift
//  Weather
//
//  Created by Michael Khavin on 25.08.2022.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach { view in
            addArrangedSubview(view)
        }
    }
}
