//
//  SettingsTableViewCellViewModel.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import Foundation

protocol SettingsTableViewCellViewModelProtocol: AnyObject {
    var settingsData: SettingData? { get }
    var viewDataDidLoad: ((SettingData) -> Void)? { get set }
    func loadViewData(by index: Int)
    func setSettings(newValue: Int)
}

final class SettingsTableViewCellViewModel: SettingsTableViewCellViewModelProtocol {
    var viewDataDidLoad: ((SettingData) -> Void)?
    private(set) var settingsData: SettingData?
    
    func loadViewData(by index: Int) {
        settingsData = SettingsManager.shared.getData(of: index)
        
        viewDataDidLoad?(settingsData!)
    }
    
    func setSettings(newValue: Int) {
        guard let data = settingsData else {
            fatalError("Settings data is nil.")
        }
        
        let value = data.values[newValue]
        SettingsManager.shared.set(value: value, of: data.setting)
    }
}
