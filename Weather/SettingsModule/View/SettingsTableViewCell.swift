//
//  SettingsTableViewCell.swift
//  Weather
//
//  Created by Michael Khavin on 17.08.2022.
//

import UIKit
import SwiftUI
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    //MARK: - Sub types and properties
    private enum LayoutConstant {
        static let offset = 10
    }
    
    var viewModel: SettingsTableViewCellViewModelProtocol! {
        didSet {
            viewModel.viewDataDidLoad = { [unowned self] data in
                titleLabel.text = data.setting.rawValue
                
                valueSegmentedControl.removeAllSegments()
                
                data.values.forEach { value in
                    let segmentPath = valueSegmentedControl.numberOfSegments > 1 ? valueSegmentedControl.numberOfSegments - 1 : valueSegmentedControl.numberOfSegments
                    valueSegmentedControl.insertSegment(withTitle: value,
                                                        at: segmentPath,
                                                        animated: false)
                }
                
                valueSegmentedControl.selectedSegmentIndex = data.currentValue
            }
        }
    }
    
    //MARK: - UI elements
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        return view
    }()
    lazy var valueSegmentedControl: UISegmentedControl = {
        let view = UISegmentedControl()
        view.backgroundColor = Color.blueBackground
        view.selectedSegmentTintColor = Color.selectedSegmentTintColor
        view.tintColor = .black
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white],
                                    for: UIControl.State.selected)
        return view
    }()

    //MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        contentView.addSubviews([
            titleLabel,
            valueSegmentedControl
        ])
        setSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Sub methods
    private func setSubviewsLayout() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(LayoutConstant.offset)
        }
        
        valueSegmentedControl.snp.makeConstraints { make in
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(LayoutConstant.offset)
            make.width.equalTo(80)
        }
    }
    
    func configureCell(by index: Int) {
        viewModel = SettingsTableViewCellViewModel()
        viewModel.loadViewData(by: index)
    }
    
    func setSettingsNewValue() {
        let value = valueSegmentedControl.selectedSegmentIndex
        viewModel.setSettings(newValue: value)
    }
}

// SwiftUI Preview
struct SettingsCellViewRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
       
        let cell = SettingsTableViewCell()
        controller.view.addSubview(cell)
        cell.frame = cell.superview?.frame ?? .zero
        cell.configureCell(by: 0)
        cell.backgroundColor = UIColor(red: 233/255.0,
                                       green: 238/255.0,
                                       blue: 250/255.0,
                                       alpha: 1)
        
        return controller
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        SettingsCellViewRepresentable()
    }
}
