//
//  WashYourHandsViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

class WashYourHandsViewController: InformationScreenViewController {
    
    var washYourHandsPresenter: WashYourHandsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.screenImage.image = UIImage(named: "handwashing")!
        self.screenTitle.text = "Wash Your Hands"
        self.screenDescription.text = "Make sure you have washed your hands before continuing with the workout, otherwise, you may cause a foreskin infection leading to a halt/reversion of your progress."
        
        self.primaryButton.setTitle("Continue", for: .normal)
        self.secondaryButton.setTitle("All Done", for: .normal)
        self.secondaryButton.isHidden = true
        self.secondaryButton.isEnabled = false
    }
    
    override func primaryButtonTapped() {
        washYourHandsPresenter.didTapContinue()
    }
    
    override func secondaryButtonTapped() {
        washYourHandsPresenter.didTapContinue()
    }

}

extension WashYourHandsViewController: WashYourHandsPresenterView {
}
