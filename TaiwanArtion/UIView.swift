//
//  UIView.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/9.
//

import UIKit

extension UIView {
    func addRoundedCornersToTopLeftAndTopRight(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.clipsToBounds = true
    }
    
    func addRoundedCorners(cornerRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
