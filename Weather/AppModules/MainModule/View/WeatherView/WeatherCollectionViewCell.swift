//
//  WeatherCollectionViewCell.swift
//  Weather
//
//  Created by Michael Khavin on 26.08.2022.
//

import UIKit
import SnapKit

class WeatherCollectionViewCell: UICollectionViewCell {
    //MARK: - Layout constants
    private enum LayoutConstants {
        static let buttonLabelHeight = 20
        static let topOffset = 20
    }
    
    //MARK: - UI elements
    private(set) lazy var currentWeatherView = CurrentWeatherView()
    private(set) lazy var forecastCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifiers.forecastCell.rawValue)
        view.backgroundColor = .white
        return view
    }()
    private(set) lazy var forecastDailyTableView: UITableView = {
        let view = UITableView()
        view.register(ForecastDailyTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.forecastDailyCell.rawValue)
        view.separatorStyle = .none
        
        if #available(iOS 15.0, *) {
            view.sectionHeaderTopPadding = 0
        }
        
        return view
    }()
    private(set) lazy var forecastDetailsButton: UIButton = {
        let view = UIButton()
        view.setTitleColor(UIColor.black, for: .normal)
        
        //Underline text
        let text = "Подробнее на 24 часа"
        let textRange = NSRange(location: 0, length: text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.underlineStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: textRange)
        
        view.setAttributedTitle(attributedText, for: .normal)
        
        return view
    }()
    private(set) lazy var tableTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Ежедневный прогноз"
        view.font = .boldSystemFont(ofSize: 18)
        return view
    }()
    private(set) lazy var tableButton: UIButton = {
        let view = UIButton()
        view.setTitleColor(UIColor.black, for: .normal)
        
        //Underline text
        let text = "25 дней"
        let textRange = NSRange(location: 0, length: text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.underlineStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: textRange)
        view.setAttributedTitle(attributedText, for: .normal)
        
        return view
    }()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews([
            currentWeatherView,
            forecastDetailsButton,
            forecastCollectionView,
            forecastDailyTableView,
            tableButton,
            tableTitleLabel
        ])
        
        backgroundColor = .white
        
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Sub methods
    private func setSubviewsLayout() {
        currentWeatherView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(layoutMarginsGuide)
            make.height.equalTo(bounds.height / 3)
        }
        
        forecastDetailsButton.snp.makeConstraints { make in
            make.trailing.equalTo(layoutMarginsGuide)
            make.top.equalTo(currentWeatherView.snp.bottom).offset(LayoutConstants.topOffset)
            make.height.equalTo(LayoutConstants.buttonLabelHeight)
        }
        
        forecastCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.height.equalTo(bounds.height / 8)
            make.top.equalTo(forecastDetailsButton.snp.bottom).offset(LayoutConstants.topOffset)
        }
        
        tableTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(layoutMarginsGuide)
            make.top.equalTo(forecastCollectionView.snp.bottom).offset(LayoutConstants.topOffset)
            make.height.equalTo(LayoutConstants.buttonLabelHeight)
        }
        
        tableButton.snp.makeConstraints { make in
            make.centerY.equalTo(tableTitleLabel)
            make.trailing.equalTo(layoutMarginsGuide)
        }
        
        forecastDailyTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(layoutMarginsGuide)
            make.height.equalTo(bounds.height / 2)
            make.top.equalTo(tableTitleLabel.snp.bottom).offset(5)
        }
    }
}
