//
//  FontsLib.swift
//  CommonCodeUtility
//
//  Created by Satyabrat Panda on 30/01/24.
//

import Foundation
import UIKit

final public class FontsLib {
    public class func regularFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.regular)
    }
    
    public class func lightFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.light)
    }
    
    public class func mediumFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.medium)
    }
    
    public class func semiboldFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.semibold)
    }
    
    public class func boldFontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
    }
    
    public static let largeTextSize: CGFloat = 48
    public static let headerFontSize: CGFloat = 24
    public static let titleFontSize: CGFloat = 20
    public static let subTitleFontSize: CGFloat = 18
    public static let subHeaderFontSize: CGFloat = 16
    public static let bodyFontSize: CGFloat = 14
    public static let bodyMenuFontSize: CGFloat = 14
    public static let captionFontSize: CGFloat = 12
    public static let badgeFontSize: CGFloat = 8
    public static let tabBarTextFontSize: CGFloat = 12
    public static let smallFontSize: CGFloat = 10
    public static let mainHeaderFontSize: CGFloat = 32
    public static let bigHeaderFontSize: CGFloat = 40
}
