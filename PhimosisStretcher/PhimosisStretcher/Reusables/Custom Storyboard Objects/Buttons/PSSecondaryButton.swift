//
//  PSSecondaryButton.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming

class PSSecondaryButton: MDCButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5
        self.setShadowColor(UIColor.clear, for: .normal)
        self.setBackgroundColor(UIColor.black)
        self.setBorderColor(UIColor.black, for: .normal)
        self.setTitleFont(Fonts.buttonFont, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.isUppercaseTitle = false
    }

}
