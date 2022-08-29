//
//  AppCoordinator.swift
//  Weather
//
//  Created by Michael Khavin on 22.08.2022.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    var navigationController: UINavigationController { get }
    var moduleBuilder: ModuleBuilderProtocol { get }
    func pushInitialView()
    func pushSettingsView()
    func popToRoot()
    func pushOnboardView()
    func pushDayPerHourForecastView()
    func pushDayForecastView()
}

class AppCoordinator: AppCoordinatorProtocol {
    private(set) var moduleBuilder: ModuleBuilderProtocol
    private(set) var navigationController: UINavigationController
    
    init(moduleBuilder: ModuleBuilderProtocol, navigationController: UINavigationController) {
        self.moduleBuilder = moduleBuilder
        self.navigationController = navigationController
    }
    
    func pushInitialView() {
        let view = moduleBuilder.assemblyMainModule(coordinator: self)
        navigationController.viewControllers = [view]
    }
    
    func pushSettingsView() {
        let view = moduleBuilder.assemblySettingsModule(coordinator: self)
        navigationController.pushViewController(view, animated: true)
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func pushOnboardView() {
        
    }
    
    func pushDayPerHourForecastView() {
        
    }
    
    func pushDayForecastView() {
        
    }
}
