//
//  CurrentWeatherItem.swift
//  Weather
//
//  Created by Michael Khavin on 25.08.2022.
//

import UIKit

class CurrentWeatherItem: UIStackView {
    //MARK: - UI elements
    private lazy var weatherImage: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view.image = UIImage(named: "wind")
        view.contentMode = .scaleAspectFit
        return view
    }()
    private lazy var imageTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "5 m/s"
        view.font = .preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        return view
    }()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViewAppearance()
        addArrangedSubviews([
            weatherImage,
            imageTitle
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Sub methods
    private func setViewAppearance() {
        axis = .horizontal
        distribution = .fill
        spacing = 5
        alignment = .center
    }
}
