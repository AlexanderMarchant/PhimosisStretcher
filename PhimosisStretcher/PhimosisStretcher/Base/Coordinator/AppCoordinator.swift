//
//  AppCoordinator.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    let alertHandlerService: AlertHandlerServiceProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    let timerService: TimerServiceProtocol
    
    var stretchesCoordinator: StretchesCoordinator!
    var workoutCoordinator: WorkoutCoordinator!
    var settingsCoordinator: SettingsCoordinator!

    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        
        self.alertHandlerService = AlertHandlerService()
        self.userDefaultsService = UserDefaultsService()
        self.timerService = TimerService()
        
        super.init()
        
        self.stretchesCoordinator = StretchesCoordinator(
            alertHandlerService,
            userDefaultsService,
            delegate: self)
        
        self.workoutCoordinator = WorkoutCoordinator(
            alertHandlerService,
            userDefaultsService,
            timerService,
            delegate: self)
        
        self.settingsCoordinator = SettingsCoordinator(
            alertHandlerService,
            userDefaultsService,
            delegate: self)
            
        ErrorScreensCoordinator.shared.navigationController = self.navigationController
        ErrorScreensCoordinator.shared.delegate = self
    }

    // MARK: - Start
    
    override func start() {
        
        let tabBarController = UITabBarController()
        
        stretchesCoordinator.start()
        workoutCoordinator.start()
        settingsCoordinator.start()
        
        tabBarController.viewControllers = [
            stretchesCoordinator.navigationController,
            workoutCoordinator.navigationController,
            settingsCoordinator.navigationController
        ]
        
        let repsPerSet = userDefaultsService.integer(forKey: Constants.repsPerWorkout)
        let repLength = userDefaultsService.integer(forKey: Constants.repLength)
        let restLength = userDefaultsService.integer(forKey: Constants.restLength)
        let prepareLength = userDefaultsService.integer(forKey: Constants.prepareLength)
        
        if(repsPerSet == 0) {
            userDefaultsService.set(5, forKey: Constants.repsPerWorkout)
        }
        if(repLength == 0) {
            userDefaultsService.set(20, forKey: Constants.repLength)
        }
        if(restLength == 0) {
            userDefaultsService.set(10, forKey: Constants.restLength)
        }
        if(prepareLength == 0) {
            userDefaultsService.set(10, forKey: Constants.prepareLength)
        }
        
        self.navigationController.navigationBar.isHidden = true
        self.navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: StretchesCoordinatorDelegate {
    
}

extension AppCoordinator: WorkoutCoordinatorDelegate {
    
}

extension AppCoordinator: SettingsCoordinatorDelegate {
    
}

extension AppCoordinator: ErrorScreensCoordinatorDelegate {
}
