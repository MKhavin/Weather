//
//  OnboardPresenter.swift
//  Weather
//
//  Created by Michael Khavin on 20.08.2022.
//

import Foundation

protocol OnboardViewModelProtocol {
    func requestLocationAuthorization()
    func dismissView()
    var coordinator: AppCoordinatorProtocol? { get set }
}

class OnboardViewModel: OnboardViewModelProtocol {
    var coordinator: AppCoordinatorProtocol?
    private var locationManager: LocationManagerProtocol?
    
    func requestLocationAuthorization() {
        locationManager?.requestLocationAuthorization()
    }
    
    func dismissView() {
        
    }
    
    init(manager: LocationManagerProtocol?, coordinator: AppCoordinatorProtocol?) {
        self.locationManager = manager
        self.coordinator = coordinator
    }
}
