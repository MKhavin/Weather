//
//  SettingsView.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import UIKit
import SnapKit

class SettingsView: UIView {
    lazy var settingsTableView: UITableView = {
        let view = UITableView()
        view.register(SettingsTableViewCell.self, forCellReuseIdentifier: CellIdentifier.settingsCell.rawValue)
        view.backgroundColor = .white
        view.separatorStyle = .none
    
        return view
    }()
    
    lazy var setUpButton: UIButton = {
        let view = UIButton()
        view.setTitle("Set-up", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = Color.buttonColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubviews([
            settingsTableView,
            setUpButton
        ])
        
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviewsLayout() {
        setUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(layoutMarginsGuide)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(50)
            make.height.equalTo(40)
        }
        settingsTableView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(layoutMarginsGuide)
            make.bottom.equalTo(setUpButton.snp.top).inset(15)
        }
    }
}
