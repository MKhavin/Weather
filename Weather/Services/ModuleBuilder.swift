//
//  ModuleBuilder.swift
//  Weather
//
//  Created by Michael Khavin on 22.08.2022.
//

import Foundation
import UIKit

protocol ModuleBuilderProtocol {
    func assemblySettingsModule(coordinator: AppCoordinatorProtocol?) -> UIViewController
    func assemblyOnboardModule(coordinator: AppCoordinatorProtocol?) -> UIViewController
    func assemblyMainModule(coordinator: AppCoordinatorProtocol?) -> UIViewController
    func assemblyDayPerHourForecastModule(coordinator: AppCoordinatorProtocol?) -> UIViewController
    func assemblyDayForecast(coordinator: AppCoordinatorProtocol?) -> UIViewController
}

struct ModuleBuilder: ModuleBuilderProtocol {
    func assemblySettingsModule(coordinator: AppCoordinatorProtocol?) -> UIViewController {
        let view = SettingsViewController()
        
        let viewModel = SettingsViewModel(coordinator: coordinator)
        
        view.viewModel = viewModel
        
        return view
    }
    
    func assemblyOnboardModule(coordinator: AppCoordinatorProtocol?) -> UIViewController {
        let view = OnboardViewController()
        let locationManager = LocationManager()
        let viewModel = OnboardViewModel(manager: locationManager, coordinator: coordinator)
        view.viewModel = viewModel
        
        return view
    }
    
    func assemblyMainModule(coordinator: AppCoordinatorProtocol?) -> UIViewController {
        let view = MainViewController()
        let viewModel = MainViewModel(coordinator: coordinator)
        view.viewModel = viewModel
        
        return view
    }
    
    func assemblyDayPerHourForecastModule(coordinator: AppCoordinatorProtocol?) -> UIViewController {
        return UIViewController()
    }
    
    func assemblyDayForecast(coordinator: AppCoordinatorProtocol?) -> UIViewController {
        return UIViewController()
    }
}
