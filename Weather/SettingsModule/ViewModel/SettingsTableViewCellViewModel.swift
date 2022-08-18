//
//  SettingsTableViewCellViewModel.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import Foundation

protocol SettingsTableViewCellViewModelProtocol: AnyObject {
    var viewDataDidLoad: ((SettingData) -> Void)? { get set }
    func loadViewData(by index: Int)
}

final class SettingsTableViewCellViewModel: SettingsTableViewCellViewModelProtocol {
    var viewDataDidLoad: ((SettingData) -> Void)?
    
    func loadViewData(by index: Int) {
        let viewData = SettingsManager.shared.getData(of: index)
        
        viewDataDidLoad?(viewData)
    }
}
