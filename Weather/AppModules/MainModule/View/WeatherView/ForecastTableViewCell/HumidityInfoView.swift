//
//  HumidityInfoView.swift
//  Weather
//
//  Created by Michael Khavin on 27.08.2022.
//

import UIKit

class HumidityInfoView: UIStackView {
    //MARK: - UI Elements
    private lazy var weatherImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "sun"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    private lazy var humidityLabel: UILabel = {
        let view = UILabel()
        view.textColor = .blue
        view.text = "57%"
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.2
        return view
    }()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setViewAppearance()
        addArrangedSubviews([
            weatherImage,
            humidityLabel
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Sub methods
    private func setViewAppearance() {
        distribution = .fillEqually
        axis = .horizontal
        alignment = .fill
        spacing = 5
    }
}
