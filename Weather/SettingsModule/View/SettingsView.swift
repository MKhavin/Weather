//
//  SettingsView.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import UIKit
import SnapKit

final class SettingsView: UIView {
    //MARK: - Sub types and properties
    private enum LayoutConstants {
        static let buttonHeight = 40
        static let buttonXMargins = 50
        static let titleOffset = 10
        static let tableTopMargin = 15
        static let tableBottomMargin = 5
    }
    
    //MARK: - UI Elements
    lazy var settingsTableView: UITableView = {
        let view = UITableView()
        view.register(SettingsTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.settingsCell.rawValue)
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.allowsSelection = false
        return view
    }()
    lazy var setUpButton: UIButton = {
        let view = UIButton()
        view.setTitle("Set-up", for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = Colors.buttonColor
        view.layer.cornerRadius = 10
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Settings"
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.settingsBackgroundColor
        layer.cornerRadius = 10
        
        addSubviews([
            titleLabel,
            settingsTableView,
            setUpButton
        ])
        
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Sub methods
    private func setSubviewsLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(layoutMarginsGuide).offset(LayoutConstants.titleOffset)
        }
        
        setUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(layoutMarginsGuide)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(LayoutConstants.buttonXMargins)
            make.height.equalTo(LayoutConstants.buttonHeight)
        }
        
        settingsTableView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.bottom.equalTo(setUpButton.snp.top).inset(LayoutConstants.tableTopMargin)
            make.top.equalTo(titleLabel.snp.bottom).offset(LayoutConstants.tableBottomMargin)
        }
    }
}
