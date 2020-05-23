//
//  String-Attributed.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

extension String {
    
    func bold() -> NSAttributedString {
        let boldedAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        
        let result = NSAttributedString(string: self, attributes: boldedAttribute)
        
        return result
    }
}


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
