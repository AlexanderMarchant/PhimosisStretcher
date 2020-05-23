//
//  EnableNotificationsViewController.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class EnableNotificationsViewController: InformationScreenViewController {
    
    var enableNotificationsPresenter: EnableNotificationsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.screenImage.image = UIImage(named: "enable-notifications")!
        self.screenTitle.text = "Enable notifications"
        self.screenDescription.text = "If you would like the app to send you workout reminders, you will need to enable notifications."
        
        self.primaryButton.setTitle("Enable", for: .normal)
        self.secondaryButton.setTitle("No thanks", for: .normal)
        self.secondaryButton.isHidden = true
    }
    
    override func primaryButtonTapped() {
        enableNotificationsPresenter.didTapEnableNotifications()
    }
    
    override func secondaryButtonTapped() {
        enableNotificationsPresenter.didTapClose()
    }

}

extension EnableNotificationsViewController: EnableNotificationsPresenterView {
    
}
