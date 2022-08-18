//
//  SettingsProperty.swift
//  Weather
//
//  Created by Michael Khavin on 19.08.2022.
//

import Foundation

enum SettingsProperty: String, CaseIterable {
    case temperature = "Temperature"
    case windSpeed = "Wind speed"
    case timeFormat = "Time format"
    case push = "Push"
    
    enum SettingValue: String {
        case celsius = "C"
        case farenheit = "F"
        case miles = "Mi"
        case kilometres = "Km"
        case twelve = "12"
        case twentyFour = "24"
        case on = "On"
        case off = "Off"
    }
    
    func getSettingValues() -> [String] {
        switch self {
            
        case .temperature:
            return [
                SettingValue.celsius.rawValue,
                SettingValue.farenheit.rawValue
            ]
        case .windSpeed:
            return [
                SettingValue.miles.rawValue,
                SettingValue.kilometres.rawValue
            ]
        case .timeFormat:
            return [
                SettingValue.twelve.rawValue,
                SettingValue.twentyFour.rawValue
            ]
        case .push:
            return [
                SettingValue.on.rawValue,
                SettingValue.off.rawValue
            ]
        }
    }
}
