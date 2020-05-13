//
//  UIColor-AppColours.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let psPlaceholderText = UIColor.init(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
    static let textBlack = UIColor.rgb(r: 7, g: 7, b: 7)
    static let textGray = UIColor.rgb(r: 180, g: 180, b: 180)
    
    static let appGreen = UIColor.rgb(r: 52, g: 209, b: 84)
    static let appRed = UIColor.rgb(r: 230, g: 57, b: 70)
    static let appBlue = UIColor.rgb(r: 52, g: 84, b: 209)
    
    static let workoutBackgroundColour = UIColor.rgb(r: 0, g: 31, b: 255)
    static let restBackgroundColour = UIColor.rgb(r: 255, g: 141, b: 50)
    static let prepareBackgroundColour = UIColor.rgb(r: 85, g: 0, b: 251)
    static let completeBackgroundColour = UIColor.rgb(r: 52, g: 84, b: 209)
    
    static let psLightGray = UIColor.rgb(r: 240, g: 240, b: 240)
    
}
