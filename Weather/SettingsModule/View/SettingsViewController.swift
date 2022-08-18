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
        view.layer.cornerRadius = 10
        return view
    }()
    
    var viewModel: SettingsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setRootViewBackground()
        
        view.addSubview(settingsView)
        setSubviewsLayout()
    }

    private func setRootViewBackground() {
        let background = UIImageView(image: UIImage(named: "SettingsBackground"))
        background.contentMode = .scaleAspectFill
        
        view.addSubview(background)
        
        background.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    private func setSubviewsLayout() {
        settingsView.snp.makeConstraints { make in
//            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY)
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
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.settingsCell.rawValue,
                                                 for: indexPath)
        
        guard let currentCell = cell as? SettingsTableViewCell else {
            return cell
        }
        
        currentCell.configureCell(by: indexPath.row)
        return currentCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Settings"
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let currentView = view as? UITableViewHeaderFooterView else {
            return
        }
        
        currentView.textLabel?.textColor = .black
        currentView.textLabel?.font = .boldSystemFont(ofSize: 20)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20
    }
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
            .previewDevice(.init(rawValue: "iPhone 8"))
        
//        SettingsViewControllerRepresentable()
//            .previewDevice(.init(rawValue: "iPhone SE (1st generation)"))
    }
}
