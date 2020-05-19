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
    
    @IBOutlet weak var stretchImage: UIImageView!
    @IBOutlet weak var stretchTitle: UILabel!
    @IBOutlet weak var stretchInfo: UILabel!
    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var steps: UILabel!
    @IBOutlet weak var closingText: UILabel!
    @IBOutlet internal var contentView: UIView!
    @IBOutlet internal var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet internal var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        stretchInfoPresenter.getStretchInfo()
    }

}

extension StretchInfoViewController: StretchInfoPresenterView {
    func didGetStretchInfo(_ stretchInfo: StretchInfo) {
        // Load image for stretch
        self.title = stretchInfo.title
        self.stretchTitle.text = stretchInfo.title
        self.stretchInfo.text = stretchInfo.stretchInfo
        self.warning.text = stretchInfo.warning
        self.steps.text = stretchInfo.steps
        self.closingText.text = stretchInfo.closingText
    }
}
