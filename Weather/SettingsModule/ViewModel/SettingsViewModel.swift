//
//  SettingsViewModel.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import Foundation

protocol SettingsViewModelProtocol {
    func numberOfRowsInSection() -> Int
    func saveSettings(completion: (() -> Void)?)
}

class SettingsViewModel: SettingsViewModelProtocol {
    func saveSettings(completion: (() -> Void)?) {
        SettingsManager.shared.saveSettings()
        completion?()
    }
    
    func numberOfRowsInSection() -> Int {
        SettingsProperty.allCases.count
    }
}
