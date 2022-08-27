//
//  CurrentWeatherCollectionViewCell.swift
//  Weather
//
//  Created by Michael Khavin on 25.08.2022.
//

import UIKit
import SwiftUI

class CurrentWeatherView: UIView {
    //MARK: - Layout constants
    private enum LayoutConstants {
        static let imageSize = 20
        static let labelInset = 26
        static let dateLabelInsetOffset = 5
        static let layerOffset: CGFloat = 10
    }
    
    //MARK: - UI elements
    private lazy var sunriseLabel: UILabel = {
        let view = getDefaultLabel()
        view.text = "05:48"
        return view
    }()
    private lazy var sunsetLabel: UILabel = {
        let view = getDefaultLabel()
        view.text = "20:00"
        return view
    }()
    private lazy var dateLabel: UILabel = {
        let view = getDefaultLabel()
        view.textColor = Colors.yellowLabelColor
        view.textAlignment = .center
        view.text = "17:00, пт 16 апреля"
        return view
    }()
    private lazy var sunsetImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "sunrise"))
        view.tintColor = Colors.yellowLabelColor
        return view
    }()
    private lazy var sunriseImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "sunset"))
        view.tintColor = Colors.yellowLabelColor
        return view
    }()
    private lazy var ellipseLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 3
        shapeLayer.strokeColor = Colors.yellowLabelColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.masksToBounds = true
        return shapeLayer
    }()
    private var weatherInfo = CurrentWeatherInfoView()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        backgroundColor = Colors.selectedSegmentTintColor
        
        layer.addSublayer(ellipseLayer)
        addSubviews([
            sunriseLabel,
            sunsetLabel,
            sunriseImage,
            sunsetImage,
            dateLabel,
            weatherInfo
        ])
        
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        redrawCircle()
        recalculateWeatherInfoFrame()
        
        layer.cornerRadius = bounds.width / 50
    }
    
    //MARK: - Sub methods
    private func recalculateWeatherInfoFrame() {
        let height = sunriseImage.frame.maxY - ellipseLayer.frame.minY - LayoutConstants.layerOffset * 2
        weatherInfo.frame = CGRect(x: ellipseLayer.frame.minX + LayoutConstants.layerOffset,
                                     y: ellipseLayer.frame.minY + LayoutConstants.layerOffset,
                                     width: ellipseLayer.frame.width - LayoutConstants.layerOffset * 2,
                                     height: height)
    }
    
    private func getDefaultLabel() -> UILabel {
        let view = UILabel()
        view.textColor = .white
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.2
        return view
    }
    
    private func redrawCircle() {
        let width = sunsetImage.frame.midX - sunriseImage.frame.midX
        let height = sunsetImage.frame.minY - 5
        
        let line = UIBezierPath(ovalIn: CGRect(x: 0,
                                               y: 10,
                                               width: width,
                                               height: height * 2))
        
        ellipseLayer.path = line.cgPath
        ellipseLayer.frame = CGRect(x: sunriseImage.frame.midX,
                                   y: 0,
                                   width: width,
                                   height: height)
    }
    
    private func setSubviewsLayout() {
        sunriseLabel.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(LayoutConstants.labelInset)
            make.leading.equalTo(layoutMargins)
        }
        
        sunsetLabel.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(LayoutConstants.labelInset)
            make.trailing.equalTo(layoutMargins)
        }
        
        sunsetImage.snp.makeConstraints { make in
            make.bottom.equalTo(sunsetLabel.snp.top)
            make.centerX.equalTo(sunsetLabel)
            make.width.height.equalTo(LayoutConstants.imageSize)
        }

        sunriseImage.snp.makeConstraints { make in
            make.bottom.equalTo(sunriseLabel.snp.top)
            make.centerX.equalTo(sunriseLabel)
            make.width.height.equalTo(LayoutConstants.imageSize)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(sunriseLabel)
            make.leading.equalTo(sunriseLabel).offset(LayoutConstants.dateLabelInsetOffset)
            make.trailing.equalTo(sunsetLabel).inset(LayoutConstants.dateLabelInsetOffset)
        }
    }
}
