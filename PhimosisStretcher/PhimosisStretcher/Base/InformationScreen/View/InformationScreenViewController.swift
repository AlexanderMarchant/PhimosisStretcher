//
//  InformationScreenViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons

class InformationScreenViewController: AdvertScreenViewController, Storyboarded {
    
    var informationScreenPresenter: InformationScreenPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    @IBOutlet weak var screenImage: UIImageView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var screenDescription: UILabel!
    @IBOutlet weak var primaryButton: PSPrimaryButton!
    @IBOutlet weak var secondaryButton: PSSecondaryButton!
    @IBOutlet weak var closeButton: MDCFloatingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addConstraints([
            NSLayoutConstraint(item: screenImage!, attribute: .top, relatedBy: .equal, toItem: bannerAdContainerView, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: closeButton!, attribute: .top, relatedBy: .equal, toItem: bannerAdContainerView, attribute: .bottom, multiplier: 1.0, constant: 0),
        ])
        
        screenImage.image = UIImage(named: "lost")!
        
        screenTitle.font = Fonts.headerFont
        screenTitle.numberOfLines = 0
        screenTitle.lineBreakMode = .byWordWrapping
        
        screenDescription.textColor = UIColor.textGray
        screenDescription.font = Fonts.textFont
        
        closeButton.setBackgroundColor(UIColor.clear, for: .normal)
        closeButton.setTitleFont(Fonts.buttonFont, for: .normal)
        closeButton.setTitleColor(UIColor.textBlack, for: .normal)
        closeButton.setImageTintColor(UIColor.textBlack, for: .normal)
        closeButton.tintColor = UIColor.textBlack
        closeButton.setShadowColor(UIColor.clear, for: .normal)
        
        closeButton.setImage(UIImage(named: "close-icon")!.withRenderingMode(.alwaysTemplate), for: .normal)
        
        primaryButton.addTarget(self, action: #selector(primaryButtonTapped), for: .touchUpInside)
        secondaryButton.addTarget(self, action: #selector(secondaryButtonTapped), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc func primaryButtonTapped() {
        psFatalError("Must override 'primaryButtonTapped' method")
    }
    
    @objc func secondaryButtonTapped() {
        psFatalError("Must override 'secondaryButtonTapped' method")
    }
    
    @objc func closeButtonTapped() {
        self.informationScreenPresenter.didTapClose()
    }

}

extension InformationScreenViewController: InformationScreenPresenterView {
    func errorOccurred(message: String) {
        self.alertHandlerService.showWarningAlert(view: self, message: message)
    }
}
