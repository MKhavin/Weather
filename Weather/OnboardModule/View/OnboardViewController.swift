//
//  OnboardViewController.swift
//  Weather
//
//  Created by Michael Khavin on 20.08.2022.
//

import UIKit

class OnboardViewController: UIViewController {
    private weak var rootView: OnboardView?
    
    override func loadView() {
        let rootView = OnboardView()
        self.rootView = rootView
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
