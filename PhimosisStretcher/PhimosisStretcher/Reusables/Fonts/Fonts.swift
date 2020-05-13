//
//  Fonts.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

struct Fonts {
    static var headerFont : UIFont {
        let headerFont = UIFont.systemFont(ofSize: 26, weight: .bold)
        let metrics = UIFontMetrics(forTextStyle: .headline)
        return metrics.scaledFont(for: headerFont)
    }
    
    static var subHeaderFont : UIFont {
        let subHeaderFont = UIFont.systemFont(ofSize: 20, weight: .medium)
        let metrics = UIFontMetrics(forTextStyle: .subheadline)
        return metrics.scaledFont(for: subHeaderFont)
    }
    
    static var buttonFont : UIFont {
        let buttonFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        let metrics = UIFontMetrics(forTextStyle: .title1)
        return metrics.scaledFont(for: buttonFont)
    }
    
    static var semiBoldTextFont: UIFont {
        let textFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        let metrics = UIFontMetrics(forTextStyle: .body)
        return metrics.scaledFont(for: textFont)
    }
    
    static var textFont: UIFont {
        let textFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        let metrics = UIFontMetrics(forTextStyle: .body)
        return metrics.scaledFont(for: textFont)
    }
    
    static var captionFont: UIFont {
        let textFont = UIFont.systemFont(ofSize: 13, weight: .regular)
        let metrics = UIFontMetrics(forTextStyle: .caption1)
        return metrics.scaledFont(for: textFont)
    }
    
    static var textFieldFont: UIFont {
        let textFieldFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        let metrics = UIFontMetrics(forTextStyle: .body)
        return metrics.scaledFont(for: textFieldFont)
    }
    
    static var goalFont: UIFont {
        let regularFont = UIFont.systemFont(ofSize: 12, weight: .semibold)
        let metrics = UIFontMetrics(forTextStyle: .caption2)
        return metrics.scaledFont(for: regularFont)
    }
    
    static var navigationBarFont: UIFont {
        let navigationBarFont = UIFont.systemFont(ofSize: 22, weight: .semibold)
        let metrics = UIFontMetrics(forTextStyle: .headline)
        return metrics.scaledFont(for: navigationBarFont)
    }
    
    static var dateHeaderFont: UIFont {
        let textFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
        let metrics = UIFontMetrics(forTextStyle: .caption1)
        return metrics.scaledFont(for: textFont)
    }
}

