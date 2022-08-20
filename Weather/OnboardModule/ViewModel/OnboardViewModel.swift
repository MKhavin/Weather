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
}

class OnboardViewModel: OnboardViewModelProtocol {
    private var locationManager: LocationManagerProtocol?
    
    func requestLocationAuthorization() {
        locationManager?.requestLocationAuthorization()
    }
    
    func dismissView() {
        
    }
    
    init(manager: LocationManagerProtocol?) {
        self.locationManager = manager
    }
}
