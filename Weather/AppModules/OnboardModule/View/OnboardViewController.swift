//
//  OnboardViewController.swift
//  Weather
//
//  Created by Michael Khavin on 20.08.2022.
//

import UIKit

class OnboardViewController: UIViewController {
    //MARK: - Sub properties
    private weak var rootView: OnboardView?
    var viewModel: OnboardViewModelProtocol!
   
    //MARK: - Life cycle methods
    override func loadView() {
        let rootView = OnboardView()
        self.rootView = rootView
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
        
        setButtonActions()
    }
    
    //MARK: - Sub methods
    private func setButtonActions() {
        rootView?.grantLocationButton.addTarget(self, action: #selector(grantButtonPressed), for: .touchUpInside)
        rootView?.disableLocationButton.addTarget(self, action: #selector(disableLocationButtonPressed), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc private func grantButtonPressed(_ sender: UIButton) {
        viewModel.requestLocationAuthorization()
    }
    
    @objc private func disableLocationButtonPressed(_ sender: UIButton) {
        viewModel.dismissView()
    }
}
