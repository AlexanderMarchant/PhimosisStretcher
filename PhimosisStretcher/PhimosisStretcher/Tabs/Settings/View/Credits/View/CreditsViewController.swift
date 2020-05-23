//
//  CreditsViewController.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {
    
    var returnsTextView = CreditsTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Credits"
        
        extendedLayoutIncludesOpaqueBars = true
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func loadView() {
        view = returnsTextView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        returnsTextView.loadContent()
    }

}
