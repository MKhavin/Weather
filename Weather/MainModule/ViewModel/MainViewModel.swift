//
//  MainViewModel.swift
//  Weather
//
//  Created by Michael Khavin on 29.08.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var coordinator: AppCoordinatorProtocol? { get set }
    func pushSettingsView()
    func getCurrentLocationWeather()
}

class MainViewModel: MainViewModelProtocol {
    var coordinator: AppCoordinatorProtocol?
    
    init(coordinator: AppCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    func pushSettingsView() {
        coordinator?.pushSettingsView()
    }
    
    func getCurrentLocationWeather() {
        
    }
}
