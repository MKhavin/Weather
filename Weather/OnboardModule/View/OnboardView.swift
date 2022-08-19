//
//  OnboardView.swift
//  Weather
//
//  Created by Michael Khavin on 20.08.2022.
//

import UIKit
import SnapKit
import SwiftUI

class OnboardView: UIView {
    
    private lazy var onboardImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "OnboardImage"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var grantLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("USE DEVICE LOCATION", for: .normal)
        button.backgroundColor = Color.buttonColor
        button.tintColor = .white
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var disableLocationButton: UIButton = {
        let button = UIButton()
        button.setTitle("NO, I'LL MANUALLY ADD LOCATION", for: .normal)
        button.tintColor = .white
        button.contentHorizontalAlignment = .trailing
        return button
    }()
    
    private lazy var descritionLabel: UILabel = {
        let view = UILabel()
        
        let titleString = "Grant to Weather app user your location data from your device\n\n\n\n"
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .semibold),
            .foregroundColor: UIColor.white
        ]
        let attributedTitleString = NSMutableAttributedString(string: titleString, attributes: titleAttributes)
        
        let descriptionString = "For more accurate weather data, while you driving or you journey\n\nYou can change your decision from app menu."
        let descriptionAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: UIColor.white
        ]
        let attributedDescriptionString = NSAttributedString(string: descriptionString, attributes: descriptionAttributes)
        
        attributedTitleString.append(attributedDescriptionString)
        
        view.attributedText = attributedTitleString
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "LaunchScreenBackgroundColor")
        
        addSubviews([
            onboardImage,
            descritionLabel,
            grantLocationButton,
            disableLocationButton
        ])
        
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviewsLayout() {
        onboardImage.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(layoutMarginsGuide).inset(100)
            make.top.leading.trailing.equalTo(layoutMarginsGuide).inset(100)
            make.height.equalTo(180)
        }
        
        disableLocationButton.snp.makeConstraints { make in
            make.bottom.equalTo(layoutMarginsGuide).inset(70)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.height.equalTo(40)
        }
        
        grantLocationButton.snp.makeConstraints { make in
            make.bottom.equalTo(disableLocationButton.snp.top)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.height.equalTo(40)
        }
        
        descritionLabel.snp.makeConstraints { make in
            make.top.equalTo(onboardImage.snp.bottom).inset(50)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.bottom.equalTo(grantLocationButton.snp.top).inset(40)
        }
    }
}


// SwiftUI Preview
struct OnboardViewRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
       
        let cell = OnboardView()
        controller.view.addSubview(cell)
        cell.frame = cell.superview?.frame ?? .zero
        
        return controller
    }
}

struct OnboardViewPreview: PreviewProvider {
    static var previews: some View {
        OnboardViewRepresentable()
    }
}
