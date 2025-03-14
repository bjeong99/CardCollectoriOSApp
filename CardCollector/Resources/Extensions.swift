//
//  Extensions.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/6/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            self.addSubview($0)
        })
    }
}
