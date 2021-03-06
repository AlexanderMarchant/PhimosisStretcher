//
//  StretchInfoViewController.swift
//  PhimosisStretches
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
    @IBOutlet weak var references: UILabel!
    @IBOutlet internal var contentView: UIView!
    @IBOutlet internal var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stretchInfoPresenter.getStretchInfo()
    }

}

extension StretchInfoViewController: StretchInfoPresenterView {
    func didGetStretchInfo(_ stretchInfo: StretchInfo) {
        self.title = stretchInfo.title
        
        if let image = UIImage(named: stretchInfo.image) {
            self.stretchImage.image = image
        }
        
        self.stretchTitle.text = stretchInfo.title
        self.stretchInfo.text = stretchInfo.stretchInfo
        self.warning.text = stretchInfo.warning
        self.steps.text = stretchInfo.steps
        self.closingText.text = stretchInfo.closingText

        var text: String?
        
        stretchInfo.references.forEach({ ref in
            if(text == nil || text!.isEmpty) {
                text = ref
            } else {
                text! = text! + "\n \n\(ref)"
            }
        })
        
        self.references.text = text ?? "No references"
    }
}
