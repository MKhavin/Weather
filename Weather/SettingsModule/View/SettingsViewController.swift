//
//  SettingsViewController.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {
    //MARK: - UI Elements
    private lazy var settingsView: SettingsView = {
        let view = SettingsView()
        view.settingsTableView.dataSource = self
        view.setUpButton.addTarget(self,
                                   action: #selector(setUpButtonPressed),
                                   for: .touchUpInside)
        return view
    }()
    
    //MARK: - Sub properties
    var viewModel: SettingsViewModelProtocol!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        print(FileManager.default.temporaryDirectory)
        // Do any additional setup after loading the view.
        setRootViewBackground()
        
        view.addSubview(settingsView)
        setSubviewsLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func updateViewConstraints() {
        settingsView.snp.updateConstraints { make in
            make.width.equalTo(view.frame.width / 1.3)
            make.height.equalTo(view.frame.height / 2)
        }
        
        super.updateViewConstraints()
    }

    //MARK: - Sub methods
    private func setRootViewBackground() {
        view.backgroundColor = .systemBackground
        
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

    //MARK: - Actions
    @objc private func setUpButtonPressed(_ sender: UIButton) {
        viewModel.saveSettings {
            let alert = UIAlertController(title: "Settings",
                                          message: "Settings was succesfully saved",
                                          preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default) { action in
                self.dismiss(animated: true)
            }
            
            alert.addAction(action)
            
            self.present(alert, animated: true)
        }
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
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

//MARK: - UITableView Data Source
extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.settingsCell.rawValue,
                                                 for: indexPath)
        
        guard let currentCell = cell as? SettingsTableViewCell else {
            return cell
        }
        
        currentCell.configureCell(by: indexPath.row)
        currentCell.valueSegmentedControl.addTarget(self,
                                                    action: #selector(segmentedControlValueChanged),
                                                    for: .valueChanged)
        return currentCell
    }
}
