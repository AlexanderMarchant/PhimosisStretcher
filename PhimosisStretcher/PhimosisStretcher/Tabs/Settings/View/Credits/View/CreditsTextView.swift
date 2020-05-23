//
//  ReturnsTextView.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class CreditsTextView: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func loadContent() {
        backgroundColor = .white
        isEditable = false
        
        guard let contentsFilepath = Bundle.main.path(forResource: "credits", ofType: "html") else {
            print("Could not find the 'credits.html' file")
            return
        }
        guard let themeFilepath = Bundle.main.path(forResource: "theme", ofType: "css") else {
            print("Could not find the 'theme.css' file")
            return
        }
        
        do {
            var contents = try String(contentsOfFile: contentsFilepath)
            var themeContents = try String(contentsOfFile: themeFilepath)
            
            // Scale up fonts based on Dynamic Type.
            let metrics = UIFontMetrics(forTextStyle: .body)
            let scaledSize = metrics.scaledValue(for: 140)
            themeContents = themeContents.replacingOccurrences(of: "[FONTSIZE]", with: "\(scaledSize)")
            
            contents = contents.replacingOccurrences(of: "[STYLE]", with: themeContents)
            
            self.attributedText = contents.htmlToAttributedString
        } catch {
            
        }
        
        scrollsToTop = true
    }
}
