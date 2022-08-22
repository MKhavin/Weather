//
//  SettingsViewController.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import UIKit
import SnapKit
import SwiftUI

final class SettingsViewController: UIViewController {
    private lazy var settingsView: SettingsView = {
        let view = SettingsView()
        view.settingsTableView.delegate = self
        view.settingsTableView.dataSource = self
        view.setUpButton.addTarget(self,
                                   action: #selector(setUpButtonPressed),
                                   for: .touchUpInside)
        view.layer.cornerRadius = 10
        return view
    }()
    
    var viewModel: SettingsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(FileManager.default.temporaryDirectory)
        // Do any additional setup after loading the view.
        viewModel = SettingsViewModel()
        
        setRootViewBackground()
        
        view.backgroundColor = .systemBackground
        view.addSubview(settingsView)
        setSubviewsLayout()
    }

    private func setRootViewBackground() {
        let background = UIImageView(image: UIImage(named: "SettingsBackground"))
        background.contentMode = .scaleAspectFill
        background.clipsToBounds = true
        
        view.addSubview(background)
        
        background.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.leading.trailing.equalTo(view)
        }
    }
    
    private func setSubviewsLayout() {
        settingsView.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.frame.width / 1.3)
            make.height.equalTo(view.frame.height / 2)
        }
    }
    
    override func updateViewConstraints() {
        settingsView.snp.updateConstraints { make in
            make.width.equalTo(view.frame.width / 1.3)
            make.height.equalTo(view.frame.height / 2)
        }
        
        super.updateViewConstraints()
    }
    
    @objc private func setUpButtonPressed(_ sender: UIButton) {
        viewModel.saveSettings {
            let alert = UIAlertController(title: "Settings",
                                          message: "Settings succesfully saved",
                                          preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default) { action in
                self.dismiss(animated: true)
            }
            
            alert.addAction(action)
            
            self.present(alert, animated: true)
        }
    }
    
    @objc private func cellValueChanged(_ sender: UISegmentedControl) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        
        guard let cell = superview as? SettingsTableViewCell else {
            return
        }
        
        cell.setSettingsNewValue()
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.settingsCell.rawValue,
                                                 for: indexPath)
        
        guard let currentCell = cell as? SettingsTableViewCell else {
            return cell
        }
        
        currentCell.configureCell(by: indexPath.row)
        currentCell.valueSegmentedControl.addTarget(self,
                                                    action: #selector(cellValueChanged),
                                                    for: .valueChanged)
        return currentCell
    }
}

extension SettingsViewController: UITableViewDelegate {
}


// SwiftUI Preview
struct SettingsViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: SettingsViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> SettingsViewController {
        let controller = SettingsViewController()
        return controller
    }
}

struct SettingsViewControllerPreview: PreviewProvider {
    static var previews: some View {
//        SettingsViewControllerRepresentable()
//            .previewDevice(.init(rawValue: "iPad (9th generation)"))
        
        SettingsViewControllerRepresentable()
            .previewDevice(.init(rawValue: "iPhone 13"))
        
//        SettingsViewControllerRepresentable()
//            .previewDevice(.init(rawValue: "iPhone SE (1st generation)"))
    }
}
