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
    
    private lazy var weatherImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "sun"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var humidityLabel: UILabel = {
        let view = UILabel()
        view.textColor = .blue
        view.text = "57%"
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "17/28"
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Colors.tableCellBackground
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getHumidityStack() -> UIStackView {
        let horizontalStackView = UIStackView(arrangedSubviews: [
            weatherImage,
            humidityLabel
        ])
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.spacing = 5
        
        return horizontalStackView
    }
    
    private func getDateAndHumidityStack() -> UIStackView {
        let verticalStackView = UIStackView(arrangedSubviews: [
            dateLabel,
            getHumidityStack()
        ])
        
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 2
        verticalStackView.distribution = .fillEqually
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
            make.width.equalTo(contentView.frame.width / 4)
            make.top.bottom.leading.equalTo(layoutMargins)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.trailing.top.bottom.equalTo(layoutMarginsGuide)
            make.width.equalTo(contentView.frame.width / 3)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(layoutMargins)
            make.leading.equalTo(dateAndHumidityStack.snp.trailing).offset(5)
            make.trailing.equalTo(tempLabel.snp.leading).inset(5)
        }
    }
    
    private func configureCell() {
        contentView.addSubview(tempLabel)
        accessoryType = .disclosureIndicator
    }
}

struct ContainerTwo: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let view = ForecastDailyTableViewCell(frame: CGRect(x: 0, y: 500, width: 400, height: 400))
        controller.view.addSubview(view)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct PreviewTwo: PreviewProvider {
    static var previews: some View {
        ContainerTwo()
    }
}
