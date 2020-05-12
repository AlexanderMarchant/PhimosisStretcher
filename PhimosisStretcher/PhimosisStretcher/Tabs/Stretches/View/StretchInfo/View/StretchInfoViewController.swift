//
//  StretchInfoViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class StretchInfoViewController: UIViewController, Storyboarded {
    
    var stretchInfoPresenter: StretchInfoPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension StretchInfoViewController: StretchInfoPresenterView {
    
}
