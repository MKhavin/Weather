//
//  SettingsProperty.swift
//  Weather
//
//  Created by Michael Khavin on 19.08.2022.
//

import Foundation

enum SettingsProperties: String, CaseIterable {
    case temperature = "Temperature"
    case windSpeed = "Wind speed"
    case timeFormat = "Time format"
    case push = "Push"
    
    enum SettingValues: String {
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
                SettingValues.celsius.rawValue,
                SettingValues.farenheit.rawValue
            ]
        case .windSpeed:
            return [
                SettingValues.miles.rawValue,
                SettingValues.kilometres.rawValue
            ]
        case .timeFormat:
            return [
                SettingValues.twelve.rawValue,
                SettingValues.twentyFour.rawValue
            ]
        case .push:
            return [
                SettingValues.on.rawValue,
                SettingValues.off.rawValue
            ]
        }
    }
}
