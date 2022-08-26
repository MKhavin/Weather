//
//  CurrentWeatherCollectionViewCell.swift
//  Weather
//
//  Created by Michael Khavin on 25.08.2022.
//

import UIKit
import SwiftUI

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    //MARK: - UI elements
    private lazy var sunriseLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "05:48"
        return view
    }()
    
    private lazy var sunsetLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "20:00"
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
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
    
    private lazy var CircleLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = 3
        shapeLayer.strokeColor = Colors.yellowLabelColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        return shapeLayer
    }()
    
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
        view.font = .preferredFont(forTextStyle: .title2)
        return view
    }()
    
    private var verticalStack: UIStackView!
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.selectedSegmentTintColor
        
        addSubviews([
            sunriseLabel,
            sunsetLabel,
            sunriseImage,
            sunsetImage,
            dateLabel
        ])
        
        layer.addSublayer(CircleLayer)
        
        setSubviewsLayout()
        setWeatherStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        redrawCircle()
//        verticalStack.frame = CGRect(x: bounds.midX,
//                                     y: bounds.midY,
//                                     width: min(bounds.width, bounds.height) - 40,
//                                     height: min(bounds.width, bounds.height) - 30)
    }
    
    //MARK: - Sub methods
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
    
    private func setWeatherStack() {
        verticalStack = UIStackView(arrangedSubviews: [
            weatherMinMaxTemp,
            weatherTemp,
            weatherDescription,
            getWeatherItemsStack()
        ])
        
        verticalStack.alignment = .center
        verticalStack.distribution = .fillEqually
        verticalStack.spacing = 5
        verticalStack.axis = .vertical
        
        addSubview(verticalStack)
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStack.snp.makeConstraints { make in
            make.bottom.equalTo(dateLabel.snp.top).inset(-15)
            make.centerX.equalTo(layoutMarginsGuide)
            make.leading.equalTo(sunriseLabel.snp.trailing).offset(10)
            make.trailing.equalTo(sunsetLabel.snp.leading).inset(-10)
            make.height.equalTo(min(bounds.width, bounds.height) / 2 - 20)
        }
    }
    
    private func redrawCircle() {
        let line = UIBezierPath(arcCenter: CGPoint(x: bounds.midX,
                                                   y: sunsetImage.frame.minY - 5),
                                radius: min(bounds.width, bounds.height) / 2 - 20,
                                startAngle: 0,
                                endAngle: CGFloat.pi,
                                clockwise: false)
        
        CircleLayer.path = line.cgPath
        CircleLayer.frame = bounds
    }
    
    private func setSubviewsLayout() {
        sunriseLabel.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(26)
            make.leading.equalTo(layoutMargins)
        }
        
        sunsetLabel.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(26)
            make.trailing.equalTo(layoutMargins)
        }
        
        sunsetImage.snp.makeConstraints { make in
            make.bottom.equalTo(sunsetLabel.snp.top)
            make.centerX.equalTo(sunsetLabel)
            make.width.height.equalTo(20)
        }

        sunriseImage.snp.makeConstraints { make in
            make.bottom.equalTo(sunriseLabel.snp.top)
            make.centerX.equalTo(sunriseLabel)
            make.width.height.equalTo(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(sunriseLabel)
            make.leading.equalTo(sunriseLabel).offset(5)
            make.trailing.equalTo(sunsetLabel).inset(5)
        }
    }
}

struct Container3: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let view = CurrentWeatherCollectionViewCell(frame: CGRect(x: 0, y: 200, width: 350, height: 400))
        controller.view.addSubview(view)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct Preview3: PreviewProvider {
    static var previews: some View {
        Container3()
    }
}
