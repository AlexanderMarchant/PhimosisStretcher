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
    
    let alertHandlerService: AlertHandlerServiceProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    
    let delegate: StretchesCoordinatorDelegate
    
    init(
        _ alertHandlerService: AlertHandlerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        delegate: StretchesCoordinatorDelegate) {
        
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
        
        self.navigationController.tabBarItem = UITabBarItem(title: "Stretches", image: UIImage(named: "info-icon"), tag: 0)
        
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
            userDefaultsService,
            with: stretchesViewController,
            delegate: self)
        
        stretchesViewController.stretchesPresenter = stretchesPresenter
        stretchesViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(stretchesViewController, animated: true)
    }
    
    func showStretchInfo() {
        let stretchInfoViewController = StretchInfoViewController.instantiate(storyboard: "StretchInfo")
        
        let stretchInfoPresenter = StretchInfoPresenter(
            userDefaultsService,
            with: stretchInfoViewController,
            delegate: self)
        
        stretchInfoViewController.stretchInfoPresenter = stretchInfoPresenter
        stretchInfoViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(stretchInfoViewController, animated: true)
    }
    
}

extension StretchesCoordinator: StretchesPresenterDelegate {
    func didSelectStretch() {
        self.showStretchInfo()
    }
}

extension StretchesCoordinator: StretchInfoPresenterDelegate {
}
