//
//  StretchesCoordinator.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

protocol StretchesCoordinatorDelegate {
}

class StretchesCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    let adServerService: AdServerServiceProtocol
    let alertHandlerService: AlertHandlerServiceProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    
    let delegate: StretchesCoordinatorDelegate
    
    init(
    _ adServerService: AdServerServiceProtocol,
        _ alertHandlerService: AlertHandlerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        delegate: StretchesCoordinatorDelegate) {
        
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = false
        
        self.navigationController.tabBarItem = UITabBarItem(title: "Stretches", image: UIImage(named: "stretches-icon"), tag: 0)
        
        self.adServerService = adServerService
        self.alertHandlerService = alertHandlerService
        self.userDefaultsService = userDefaultsService
        self.delegate = delegate
    }
    
    override func start() {
        self.showStretches()
    }
    
    func showStretches() {
        let stretchesViewController = StretchesViewController.instantiate(storyboard: "Stretches")
        
        let stretchesPresenter = StretchesPresenter(
            adServerService,
            userDefaultsService,
            with: stretchesViewController,
            delegate: self)
        
        stretchesViewController.advertScreenPresenter = stretchesPresenter
        stretchesViewController.stretchesPresenter = stretchesPresenter
        stretchesViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(stretchesViewController, animated: true)
    }
    
    func showUnderstandingPhimosis(_ understandingPhimosis: UnderstandingPhimosis) {
        let understandingPhimosisViewController = UnderstandingPhimosisViewController.instantiate(storyboard: "UnderstandingPhimosis")
        
        let understandingPhimosisPresenter = UnderstandingPhimosisPresenter(
            understandingPhimosis,
            with: understandingPhimosisViewController,
            delegate: self)
        
        understandingPhimosisViewController.understandingPhimosisPresenter = understandingPhimosisPresenter
        understandingPhimosisViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(understandingPhimosisViewController, animated: true)
    }
    
    func showStretchInfo(_ selectedStretch: StretchInfo) {
        let stretchInfoViewController = StretchInfoViewController.instantiate(storyboard: "StretchInfo")
        
        let stretchInfoPresenter = StretchInfoPresenter(
            selectedStretch,
            userDefaultsService,
            with: stretchInfoViewController,
            delegate: self)
        
        stretchInfoViewController.stretchInfoPresenter = stretchInfoPresenter
        stretchInfoViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(stretchInfoViewController, animated: true)
    }
    
}

extension StretchesCoordinator: StretchesPresenterDelegate {
    func didSelectStretch(_ selectedStretch: StretchInfo) {
        self.showStretchInfo(selectedStretch)
    }
    
    func didSelectUnderstandingPhimosis(_ understandingPhimosis: UnderstandingPhimosis) {
        self.showUnderstandingPhimosis(understandingPhimosis)
    }
    
    func didSelectSafetyMeasures(_ safetyMeasures: SafetyMeasures) {
        // Shwo safety measures VC
    }
}

extension StretchesCoordinator: StretchInfoPresenterDelegate {
}

extension StretchesCoordinator: UnderstandingPhimosisPresenterDelegate {
}
