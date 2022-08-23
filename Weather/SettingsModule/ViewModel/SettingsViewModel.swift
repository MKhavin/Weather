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
    var coordinator: AppCoordinatorProtocol? { get set }
}

class SettingsViewModel: SettingsViewModelProtocol {
    var coordinator: AppCoordinatorProtocol?
    
    init(coordinator: AppCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    func saveSettings(completion: (() -> Void)?) {
        SettingsManager.shared.saveSettings()
        completion?()
        coordinator?.popToRoot()
    }
    
    func numberOfRowsInSection() -> Int {
        SettingsProperties.allCases.count
    }
}
