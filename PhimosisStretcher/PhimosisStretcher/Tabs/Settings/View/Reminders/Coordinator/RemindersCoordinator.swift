//
//  RemindersCoordinator.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import UserNotifications

protocol RemindersCoordinatorDelegate {
}

class RemindersCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    let alertHandlerService: AlertHandlerServiceProtocol
    let delegate: RemindersCoordinatorDelegate
    
    init(
        _ navigationController: UINavigationController,
        _ alertHandlerService: AlertHandlerServiceProtocol,
        delegate: RemindersCoordinatorDelegate) {
        
        self.navigationController = navigationController
        self.alertHandlerService = alertHandlerService
        self.delegate = delegate
    }
    
    override func start() {
        self.showReminders()
    }
    
    func showReminders() {
        let viewController = RemindersViewController.instantiate(storyboard: "Reminders")
        
        let remindersPresenter = RemindersPresenter(
            with: viewController,
            delegate: self)
        
        viewController.remindersPresenter = remindersPresenter
        viewController.alertHandlerService = alertHandlerService
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showAddReminder()
    {
        let viewController = AddReminderViewController.instantiate(storyboard: "AddReminder")
        
        let addReminderPresenter = AddReminderPresenter(
            with: viewController,
            delegate: self)
        
        viewController.addReminderPresenter = addReminderPresenter
        viewController.alertHandlerService = alertHandlerService
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension RemindersCoordinator: RemindersPresenterDelegate {
    func didTapAddReminder() {
        self.showAddReminder()
    }
}

extension RemindersCoordinator: AddReminderPresenterDelegate {
    func didAddReminder() {
        self.navigationController.popViewController(animated: true)
    }
}
