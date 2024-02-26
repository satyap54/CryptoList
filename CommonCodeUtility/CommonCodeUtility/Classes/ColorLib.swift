//
//  ColorLib.swift
//  CommonCodeUtility
//
//  Created by Satyabrat Panda on 31/01/24.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexValue = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

final public class ColorLib {
    public static let info: [UIColor] = [
        UIColor(hex: "#C2D0F2"), UIColor(hex: "#89A5E3"), UIColor(hex: "#3F6FD9"), UIColor(hex: "#2C5ECD"),
        UIColor(hex: "#144CC7")
    ].compactMap({ $0 })
    
    public static let black: [UIColor] = [
        UIColor(hex: "#8A8A8A"), UIColor(hex: "#3D3D3D"), UIColor(hex: "#161616"), UIColor(hex: "#121212"),
        UIColor(hex: "#0D0D0D")
    ].compactMap({ $0 })
    
    public static let white: [UIColor] = [
        UIColor(hex: "#D2D2D2"), UIColor(hex: "#E0E0E0"), UIColor(hex: "#EFEFEF"), UIColor(hex: "#FBFBFB"),
        UIColor(hex: "#FFFFFF")
    ].compactMap({ $0 })
    
    public static let green: [UIColor] = [
        UIColor(hex: "#E6F9F1"), UIColor(hex: "#83E0B8"), UIColor(hex: "#4FE3A3"), UIColor(hex: "#1FC87F"),
        UIColor(hex: "#06C270")
    ].compactMap({ $0 })
}
