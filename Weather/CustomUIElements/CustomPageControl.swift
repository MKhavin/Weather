//
//  CustomPageControl.swift
//  Weather
//
//  Created by Michael Khavin on 27.08.2022.
//

import UIKit

class CustomPageControl: UIPageControl {
    override var currentPage: Int {
        didSet {
            if #available(iOS 14.0, *) {
                updateIndicatorImage()
            } else {
                updateIndicator()
            }
        }
    }
    
    @available(iOS 14.0, *)
    func updateIndicatorImage() {
        for index in 0..<numberOfPages {
            if index == currentPage {
                setIndicatorImage(UIImage(systemName: "circle.fill"), forPage: index)
            } else {
                setIndicatorImage(UIImage(systemName: "circle"), forPage: index)
            }
        }
    }
    
    @available(iOS, deprecated: 14, message: "We no longer show an app introduction on iOS 14 and up")
    func updateIndicator() {
        for (pageIndex, dotView) in subviews.enumerated() {
            if self.currentPage == pageIndex {
                dotView.backgroundColor = .black
            } else {
                dotView.backgroundColor = .white
                dotView.layer.borderColor = UIColor.black.cgColor
                dotView.layer.borderWidth = 2
            }
        }
    }
}
