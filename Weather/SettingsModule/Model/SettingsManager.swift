//
//  SettingsManager.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import Foundation

protocol SettingsManagerProtocol {
    func set(value: SettingsProperty.SettingValue, of setting: SettingsProperty)
    func getValue(of setting: SettingsProperty) -> SettingsProperty.SettingValue?
    func getData(of settingIndex: Int) -> SettingData
    static var shared: SettingsManagerProtocol { get }
}

class SettingsManager: SettingsManagerProtocol {
    static let shared: SettingsManagerProtocol = SettingsManager()
    private var settings: [String : Any]
    
    init() {
        settings = UserDefaults.standard.dictionaryRepresentation()
    }
    
    func set(value: SettingsProperty.SettingValue, of settings: SettingsProperty) {
        self.settings[settings.rawValue] = value
        UserDefaults.standard.set(value, forKey: settings.rawValue)
    }
    
    func getValue(of setting: SettingsProperty) -> SettingsProperty.SettingValue? {
        return settings[setting.rawValue] as? SettingsProperty.SettingValue
    }
    
    func getData(of settingIndex: Int) -> SettingData {
        let setting = SettingsProperty.allCases[settingIndex]
        let values = setting.getSettingValues()
        
        return SettingData(setting: setting, values: values)
    }
}
