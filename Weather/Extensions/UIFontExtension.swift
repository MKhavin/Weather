//
//  UIFontExtension.swift
//  Weather
//
//  Created by Michael Khavin on 20.08.2022.
//

import UIKit

extension UIFont {
//    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
//        let descriptor = fontDescriptor.withSymbolicTraits(traits)
//        return UIFont(descriptor: descriptor!, size: 0)
//    }
    
    func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]
        traits[.weight] = weight
        
        attributes[.traits] = traits
        
        let descriptor = UIFontDescriptor(fontAttributes: attributes)
        
        return UIFont(descriptor: descriptor, size: 0)
    }
}
