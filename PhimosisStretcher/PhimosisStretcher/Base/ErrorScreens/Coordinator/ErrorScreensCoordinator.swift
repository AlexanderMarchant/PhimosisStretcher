//
//  ErrorScreensCoordinator.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

protocol ErrorScreensCoordinatorDelegate {
}

extension ErrorScreensCoordinatorDelegate {
}

class ErrorScreensCoordinator: Coordinator {
    
    static let shared = ErrorScreensCoordinator()
    
    var adServerService: AdServerServiceProtocol!
    var delegate: ErrorScreensCoordinatorDelegate?
    var navigationController: UINavigationController!
    
    override init() {
        self.adServerService = AdServerService(UserDefaultsService())
    }
    
    override func start() {
        // Don't do anything
    }
    
    func showEnableNotifications() {
        let viewController = EnableNotificationsViewController.instantiate(storyboard: "EnableNotifications")
        
        let enableNotificationsPresenter = EnableNotificationsPresenter(
                adServerService,
                with: viewController,
                delegate: self)
        
        viewController.advertScreenPresenter = enableNotificationsPresenter
        viewController.informationScreenPresenter = enableNotificationsPresenter
        viewController.enableNotificationsPresenter = enableNotificationsPresenter
        viewController.alertHandlerService = AlertHandlerService()
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
}

extension ErrorScreensCoordinator: InformationScreenPresenterDelegate {
    func didTapClose() {
        self.navigationController.popViewController(animated: true)
    }
}

extension ErrorScreensCoordinator: EnableNotificationsPresenterDelegate {
    func didComplete() {
        self.navigationController.popViewController(animated: true)
    }
}
