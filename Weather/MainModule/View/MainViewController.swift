//
//  MainViewController.swift
//  Weather
//
//  Created by Michael Khavin on 26.08.2022.
//

import UIKit
import SwiftUI
import SnapKit

class MainViewController: UIViewController {
    //MARK: - UI Elements
    private lazy var weatherCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifiers.weatherCell.rawValue)
        view.collectionViewLayout = layout
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    private lazy var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.numberOfPages = 2
//        view.backgroundStyle = .minimal
        view.currentPage = 0
//        view.backgroundColor = .black
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = .white
        view.addTarget(self, action: #selector(pageDidChanged(_:)), for: .valueChanged)
        return view
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubviews([
            weatherCollectionView,
            pageControl
        ])
        setSubviewsLayout()
    }

    private func setSubviewsLayout() {
        pageControl.snp.makeConstraints { make in
            make.centerX.top.equalTo(view.layoutMarginsGuide)
        }
        
        weatherCollectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.layoutMarginsGuide)
            make.top.equalTo(pageControl.snp.bottom).offset(5)
        }
    }
    
    //MARK: - Actions
    @objc private func pageDidChanged(_ sender: UIPageControl) {
        let currentPage = CGFloat(sender.currentPage)
        weatherCollectionView.setContentOffset(CGPoint(x: currentPage * weatherCollectionView.frame.width, y: 0),
                                               animated: true)
    }
}

//MARK: - UICollectionView delegate
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView === weatherCollectionView {
            return collectionView.frame.size
        }  else {
            return CGSize(width: collectionView.frame.width / 7,
                          height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView === weatherCollectionView {
            return 0
        }  else {
            return 15
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(currentPage)
        
    }
}

//MARK: - UICollectionView data source
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView === weatherCollectionView {
            return 2
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView === weatherCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.weatherCell.rawValue, for: indexPath) as? WeatherCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.forecastDailyTableView.delegate = self
            cell.forecastDailyTableView.dataSource = self
            cell.forecastCollectionView.delegate = self
            cell.forecastCollectionView.dataSource = self
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.forecastCell.rawValue, for: indexPath) as? ForecastCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
        }
    }
}

//MARK: - UITableView delegate
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.forecastDailyCell.rawValue, for: indexPath) as? ForecastDailyTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

//MARK: - UITableView data source
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 2
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.bounds.height / 4
    }
}
