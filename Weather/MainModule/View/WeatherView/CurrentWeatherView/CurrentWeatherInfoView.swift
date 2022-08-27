//
//  WeatherInfoView.swift
//  Weather
//
//  Created by Michael Khavin on 27.08.2022.
//

import UIKit

class CurrentWeatherInfoView: UIStackView {
    //MARK: - UI Elements
    private lazy var windItem: CurrentWeatherItem = CurrentWeatherItem()
    private lazy var humidityItem: CurrentWeatherItem = CurrentWeatherItem()
    private lazy var sunItem: CurrentWeatherItem = CurrentWeatherItem()
    private lazy var weatherDescription: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "Возможно будет дождь"
        view.numberOfLines = 1
        return view
    }()
    private lazy var weatherTemp: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "13"
        view.font = .preferredFont(forTextStyle: .title1)
        return view
    }()
    private lazy var weatherMinMaxTemp: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "7/15"
        view.font = .preferredFont(forTextStyle: .title3)
        return view
    }()

    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViewAppearance()
        addArrangedSubviews([
            weatherMinMaxTemp,
            weatherTemp,
            weatherDescription,
            getWeatherItemsStack()
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Sub properties
    private func setViewAppearance() {
        alignment = .center
        distribution = .fillEqually
        spacing = 5
        axis = .vertical
    }
    
    private func getWeatherItemsStack() -> UIStackView {
        let horizontalStack = UIStackView(arrangedSubviews: [
            sunItem,
            windItem,
            humidityItem
        ])
        
        horizontalStack.alignment = .center
        horizontalStack.distribution = .fillEqually
        horizontalStack.spacing = 5
        horizontalStack.axis = .horizontal
        
        return horizontalStack
    }
}
