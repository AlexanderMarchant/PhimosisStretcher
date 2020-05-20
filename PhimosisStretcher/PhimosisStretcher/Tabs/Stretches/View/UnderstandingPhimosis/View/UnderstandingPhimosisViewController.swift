//
//  UnderstandingPhimosisViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 20/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class UnderstandingPhimosisViewController: UIViewController, Storyboarded {
    
    var understandingPhimosisPresenter: UnderstandingPhimosisPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var introduction: UILabel!
    @IBOutlet weak var casuses: UILabel!
    @IBOutlet weak var solutions: UILabel!
    @IBOutlet weak var goodNews: UILabel!
    @IBOutlet weak var references: UILabel!
    @IBOutlet internal var contentView: UIView!
    @IBOutlet internal var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        understandingPhimosisPresenter.getInfo()
    }

}

extension UnderstandingPhimosisViewController: UnderstandingPhimosisPresenterView {
    func didGetInfo(_ understandingPhimosis: UnderstandingPhimosis) {
        self.title = understandingPhimosis.title
        
        if let image = UIImage(named: understandingPhimosis.image) {
            self.headerImage.image = image
        }
        
        self.headerTitle.text = understandingPhimosis.title
        self.introduction.text = understandingPhimosis.introduction
        self.casuses.text = understandingPhimosis.casuses
        self.solutions.text = understandingPhimosis.solutions
        self.goodNews.text = understandingPhimosis.goodNews

        var text: String?
        
        understandingPhimosis.references.forEach({ ref in
            if(text == nil || text!.isEmpty) {
                text = ref
            } else {
                text! = text! + "\n \n\(ref)"
            }
        })
        
        self.references.text = text ?? "No references"
    }
}
