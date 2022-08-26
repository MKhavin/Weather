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
        view.textColor = .lightGray
        view.textAlignment = .center
        view.text = "14:00"
        return view
    }()
    private lazy var tempLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.text = "7+"
        view.textAlignment = .center
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
            contentView.backgroundColor = isSelected ? Colors.blueBackground : .white
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
        
        let corners = UIRectCorner(arrayLiteral: [.allCorners])
        let cornersPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: 50, height: 50))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = cornersPath.cgPath
        
        layer.mask = maskLayer
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
}


struct Container: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let view = ForecastCollectionViewCell(frame: CGRect(x: 150, y: 200, width: 80, height: 150))
        controller.view.addSubview(view)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        Container()
    }
}
