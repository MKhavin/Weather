//
//  ModuleBuilder.swift
//  Weather
//
//  Created by Michael Khavin on 22.08.2022.
//

import Foundation
import UIKit

protocol ModuleBuilderProtocol {
    func assemblySettingsModule() -> UIViewController
    func assemblyOnboardModule() -> UIViewController
    func assemblyMainModule() -> UIViewController
    func assemblyDayPerHourForecastModule() -> UIViewController
    func assemblyDayForecast() -> UIViewController
}

struct ModuleBuilder: ModuleBuilderProtocol {
    func assemblySettingsModule() -> UIViewController {
        let view = SettingsViewController()
        
        let viewModel = SettingsViewModel()
        
        view.viewModel = viewModel
        
        return view
    }
    
    func assemblyOnboardModule() -> UIViewController {
        return UIViewController()
    }
    
    func assemblyMainModule() -> UIViewController {
        return UIViewController()
    }
    
    func assemblyDayPerHourForecastModule() -> UIViewController {
        return UIViewController()
    }
    
    func assemblyDayForecast() -> UIViewController {
        return UIViewController()
    }
}
