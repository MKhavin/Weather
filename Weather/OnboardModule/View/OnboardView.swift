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
    //MARK: - UI elements
    private lazy var onboardImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "OnboardImage"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var grantLocationButton: OnboardButton = {
        let button = OnboardButton()
        button.setTitle("USE DEVICE LOCATION", for: .normal)
        button.backgroundColor = Color.buttonColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = disableLocationButton.titleLabel?.font
        return button
    }()
    
    lazy var disableLocationButton: OnboardButton = {
        let button = OnboardButton()
        button.setTitle("NO, I'LL MANUALLY ADD LOCATION", for: .normal)
        return button
    }()
    
    private lazy var descritionLabel: UILabel = {
        let view = UILabel()
        
        // Attributed string
        let titleString = "Grant to Weather app user your location data from your device\n\n"
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .title2).withWeight(.semibold),
            .foregroundColor: UIColor.white
        ]
        let attributedTitleString = NSMutableAttributedString(string: titleString, attributes: titleAttributes)
        
        let descriptionString = "For more accurate weather data, while you driving or you journey\n\nYou can change your decision from app menu."
        let descriptionAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .body),
            .foregroundColor: UIColor.white
        ]
        let attributedDescriptionString = NSAttributedString(string: descriptionString, attributes: descriptionAttributes)
        
        attributedTitleString.append(attributedDescriptionString)
        //
        
        view.attributedText = attributedTitleString
        view.textAlignment = .center
        view.numberOfLines = 0
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.2
        return view
    }()
    //

    //MARK: - Life cycle
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
    
    //MARK: - Sub properties
    private func setSubviewsLayout() {
        onboardImage.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).offset(20)
            make.height.equalTo(UIScreen.main.bounds.height / 3)
        }
        
        disableLocationButton.snp.makeConstraints { make in
            make.bottom.equalTo(layoutMarginsGuide).offset(-40)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.height.equalTo(40)
        }
        
        grantLocationButton.snp.makeConstraints { make in
            make.bottom.equalTo(disableLocationButton.snp.top)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.height.equalTo(40)
        }
        
        descritionLabel.snp.makeConstraints { make in
            make.top.equalTo(onboardImage.snp.bottom).offset(40)
            make.leading.trailing.equalTo(layoutMarginsGuide)
            make.bottom.equalTo(grantLocationButton.snp.top).offset(-50)
        }
    }
}

//MARK: - SwiftUI Preview
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
//            .previewDevice(.init(rawValue: "iPad (9th generation)"))
    }
}
