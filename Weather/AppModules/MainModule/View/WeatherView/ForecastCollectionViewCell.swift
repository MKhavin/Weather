//
//  ForecastCollectionViewCell.swift
//  Weather
//
//  Created by Michael Khavin on 24.08.2022.
//

import UIKit
import SnapKit
import SwiftUI

class ForecastCollectionViewCell: UICollectionViewCell {
    //MARK: - UI Elements
    private lazy var timeLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .center
        view.text = "14:00"
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.2
        return view
    }()
    private lazy var tempLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.text = "7+"
        view.textAlignment = .center
        view.font = timeLabel.font
        return view
    }()
    private lazy var weatherImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "sun"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    //MARK: - Sub properties
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? Colors.selectedSegmentTintColor : .white
            timeLabel.textColor = isSelected ? .white : .black
            tempLabel.textColor = isSelected ? .white : .black
        }
    }
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCellAppearance()
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Sub methods
    private func setSubviewsLayout() {
        let stackView = UIStackView(arrangedSubviews: [
            timeLabel,
            weatherImageView,
            tempLabel
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(layoutMarginsGuide)
        }
    }
    
    private func setCellAppearance() {
        backgroundColor = .white
        layer.cornerRadius = bounds.width / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        clipsToBounds = true
    }
    
}
