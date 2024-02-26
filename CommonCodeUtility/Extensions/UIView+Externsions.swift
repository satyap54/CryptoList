//
//  UIView+Externsions.swift
//  CommonCodeUtility
//
//  Created by Satyabrat Panda on 31/01/24.
//

import UIKit
import Foundation

@available(iOS 11.0, *)
extension UIView {
   public func applyRoundCornersToTop(radius: CGFloat) {
       clipsToBounds = true
       layer.cornerRadius = radius
       layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
}
