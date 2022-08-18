//
//  SettingData.swift
//  Weather
//
//  Created by Michael Khavin on 19.08.2022.
//

import Foundation

struct SettingData {
    let setting: SettingsProperty
    let values: [String]
    var currentValue: Int {
        let value = SettingsManager.shared.getValue(of: setting)
        
        if let unwrappedValue = value {
            return values.firstIndex(of: unwrappedValue.rawValue) ?? 0
        } else {
            return 0
        }
    }
}
