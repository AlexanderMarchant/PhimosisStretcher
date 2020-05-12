//
//  PSDestructiveButton.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming

class PSDestructiveButton: MDCRaisedButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setBackgroundColor(UIColor.appRed)
        self.setTitleFont(Fonts.buttonFont, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.isUppercaseTitle = false
    }

}
