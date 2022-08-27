//
//  ForecastDailyTableViewCell.swift
//  Weather
//
//  Created by Michael Khavin on 24.08.2022.
//

import UIKit
import SnapKit
import SwiftUI

class ForecastDailyTableViewCell: UITableViewCell {
    //MARK: - UI elements
    private lazy var tempLabel: UILabel = {
        let view = UILabel()
        view.text = "7-10"
        return view
    }()
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Облачно"
        view.textAlignment = .left
        view.numberOfLines = 1
        return view
    }()
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "17/28"
        return view
    }()
    private lazy var humidityInfo = HumidityInfoView()
    
    //MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        backgroundColor = Colors.tableCellBackground
        accessoryType = .disclosureIndicator
        layer.cornerRadius = 10
        
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Sub methods
    private func getDateAndHumidityStack() -> UIStackView {
        let verticalStackView = UIStackView(arrangedSubviews: [
            dateLabel,
            humidityInfo
        ])
        
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 2
        verticalStackView.distribution = .equalSpacing
        verticalStackView.alignment = .center
        
        return verticalStackView
    }
    
    private func setSubviewsLayout() {
        let dateAndHumidityStack = getDateAndHumidityStack()
        
        contentView.addSubviews([
            dateAndHumidityStack,
            descriptionLabel,
            tempLabel
        ])
        
        dateAndHumidityStack.snp.makeConstraints { make in
            make.width.equalTo(contentView.frame.width / 6)
            make.top.bottom.leading.equalTo(layoutMargins)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.trailing.top.bottom.equalTo(layoutMarginsGuide)
            make.width.equalTo(contentView.frame.width / 5)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(layoutMargins)
            make.leading.equalTo(dateAndHumidityStack.snp.trailing).offset(10)
            make.trailing.equalTo(tempLabel.snp.leading).inset(-10)
        }
    }
    
    private func configureCell() {
//        contentView.addSubview(tempLabel)
//        accessoryType = .disclosureIndicator
    }
}
