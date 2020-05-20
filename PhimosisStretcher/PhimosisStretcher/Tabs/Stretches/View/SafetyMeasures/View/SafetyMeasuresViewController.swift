//
//  SafetyMeasuresViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 20/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class SafetyMeasuresViewController: UIViewController, Storyboarded {
        
    var safetyMeasuresPresenter: SafetyMeasuresPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var introduction: UILabel!
    @IBOutlet weak var safetyMeasures: UILabel!
    @IBOutlet weak var references: UILabel!
    @IBOutlet internal var contentView: UIView!
    @IBOutlet internal var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safetyMeasuresPresenter.getSafetyMeasures()
    }

}

extension SafetyMeasuresViewController: SafetyMeasuresPresenterView {
    
    func didGetSafetyMeasures(_ safetyMeasures: SafetyMeasures) {
        self.title = safetyMeasures.title
        
        if let image = UIImage(named: safetyMeasures.image) {
            self.headerImage.image = image
        }
        
        self.headerTitle.text = safetyMeasures.title
        self.introduction.text = safetyMeasures.introduction
        
        let attrs = [NSAttributedString.Key.font : Fonts.semiBoldTextFont]
        let attributedString = NSMutableAttributedString(string: "", attributes: attrs)
        
        safetyMeasures.safetyTips.forEach({ safetyTip in
            
            var titleString: NSMutableAttributedString!
            var descriptionText: NSMutableAttributedString!
            
            if(attributedString.string.isEmpty) {
                
                titleString = NSMutableAttributedString(string: safetyTip.title, attributes: attrs)
                descriptionText = NSMutableAttributedString(string: "\n\n\(safetyTip.explanation)")
            } else {
                titleString = NSMutableAttributedString(string: "\n\n\n\(safetyTip.title)", attributes: attrs)
                descriptionText = NSMutableAttributedString(string: "\n\n\(safetyTip.explanation)")
            }
            
            attributedString.append(titleString)
            attributedString.append(descriptionText)
        })
        
        self.safetyMeasures.attributedText = attributedString

        var text: String?
        
        safetyMeasures.references.forEach({ ref in
            if(text == nil || text!.isEmpty) {
                text = ref
            } else {
                text! = text! + "\n \n\(ref)"
            }
        })
        
        self.references.text = text ?? "No references"
    }
}
