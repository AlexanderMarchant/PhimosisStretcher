//
//  RepsLeftLabel.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class RepsLeftLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        updateView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var intrinsicContentSize: CGSize {
        let originContentSize = super.intrinsicContentSize
        
        let width = originContentSize.width + 25
        let height = originContentSize.height + 25
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        return CGSize(width: width, height: height)
    }
    
    internal func updateView()
    {
        self.backgroundColor = UIColor.white
        self.textAlignment = .center
        self.font = Fonts.navigationBarFont
    }

}
