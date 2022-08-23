//
//  SettingsManager.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import Foundation

protocol SettingsManagerProtocol {
    func set(value: String, of setting: SettingsProperties)
    func getValue(of setting: SettingsProperties) -> String?
    func getData(of settingIndex: Int) -> SettingData
    func saveSettings()
    static var shared: SettingsManagerProtocol { get }
}

class SettingsManager: SettingsManagerProtocol {
    static let shared: SettingsManagerProtocol = SettingsManager()
    private var settings: [String : Any] = [:]
    
    init() {
        if let savedSettings = UserDefaults.standard.dictionary(forKey: "UserSettings") {
            settings = savedSettings
        } else {
            SettingsProperties.allCases.forEach { setting in
                self.settings[setting.rawValue] = setting.getSettingValues()[0]
            }
            
            saveSettings()
        }
    }
    
    func set(value: String, of settings: SettingsProperties) {
        self.settings[settings.rawValue] = value
    }
    
    func getValue(of setting: SettingsProperties) -> String? {
        return settings[setting.rawValue] as? String
    }
    
    func getData(of settingIndex: Int) -> SettingData {
        let setting = SettingsProperties.allCases[settingIndex]
        let values = setting.getSettingValues()
        
        return SettingData(setting: setting, values: values)
    }
    
    func saveSettings() {
        UserDefaults.standard.set(settings, forKey: "UserSettings")
    }
}
