//
//  SettingsViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, Storyboarded {
    
    var settingsPresenter: SettingsPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension SettingsViewController: SettingsPresenterView {
    
}
