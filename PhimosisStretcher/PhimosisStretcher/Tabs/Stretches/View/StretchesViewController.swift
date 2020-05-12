//
//  StretchesViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class StretchesViewController: UIViewController, Storyboarded {
    
    var stretchesPresenter: StretchesPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    @IBAction func stretchInfoButtonTapped(_ sender: Any) {
        stretchesPresenter.didSelectStretch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension StretchesViewController: StretchesPresenterView {
    
}
