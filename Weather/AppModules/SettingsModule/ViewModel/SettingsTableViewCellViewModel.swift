//
//  SettingsTableViewCellViewModel.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import Foundation

//MARK: - ViewModel Protocol
protocol SettingsTableViewCellViewModelProtocol: AnyObject {
    var viewDataDidLoad: ((SettingData) -> Void)? { get set }
    func loadViewData(by index: Int)
    func setSettings(newValue: Int)
}

//MARK: - Protocol implementation
final class SettingsTableViewCellViewModel: SettingsTableViewCellViewModelProtocol {
    var viewDataDidLoad: ((SettingData) -> Void)?
    private var settingsData: SettingData!
    
    func loadViewData(by index: Int) {
        settingsData = SettingsManager.shared.getData(of: index)
        
        viewDataDidLoad?(settingsData!)
    }
    
    func setSettings(newValue: Int) {
        let value = settingsData.values[newValue]
        SettingsManager.shared.set(value: value, of: settingsData.setting)
    }
}
