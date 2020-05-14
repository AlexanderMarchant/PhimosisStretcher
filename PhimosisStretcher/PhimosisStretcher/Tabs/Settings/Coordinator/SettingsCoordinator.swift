//
//  SettingsCoordinator.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

protocol SettingsCoordinatorDelegate {
}

class SettingsCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    let alertHandlerService: AlertHandlerServiceProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    
    let delegate: SettingsCoordinatorDelegate
    
    init(
        _ alertHandlerService: AlertHandlerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        delegate: SettingsCoordinatorDelegate) {
        
        self.navigationController = UINavigationController()
        
        self.navigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings-icon"), tag: 0)
        
        self.alertHandlerService = alertHandlerService
        self.userDefaultsService = userDefaultsService
        self.delegate = delegate
    }
    
    override func start() {
        self.showSettings()
    }
    
    func showSettings() {
        let settingsViewController = SettingsViewController.instantiate(storyboard: "Settings")
        
        let settingsPresenter = SettingsPresenter(
            userDefaultsService,
            with: settingsViewController,
            delegate: self)
        
        settingsViewController.settingsPresenter = settingsPresenter
        settingsViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(settingsViewController, animated: true)
    }
    
}

extension SettingsCoordinator: SettingsPresenterDelegate {
}
