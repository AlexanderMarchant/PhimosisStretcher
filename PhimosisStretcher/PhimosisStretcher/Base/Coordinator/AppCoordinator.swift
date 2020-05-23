//
//  AppCoordinator.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    let adServerService: AdServerServiceProtocol
    let alertHandlerService: AlertHandlerServiceProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    let workoutCueService: WorkoutCueServiceProtocol
    
    var stretchesCoordinator: StretchesCoordinator!
    var workoutCoordinator: WorkoutCoordinator!
    var settingsCoordinator: SettingsCoordinator!

    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        
        self.alertHandlerService = AlertHandlerService()
        self.userDefaultsService = UserDefaultsService()
        self.workoutCueService = WorkoutCueService()
        self.adServerService = AdServerService(userDefaultsService)
        
        super.init()
        
        self.stretchesCoordinator = StretchesCoordinator(
            adServerService,
            alertHandlerService,
            userDefaultsService,
            delegate: self)
        
        self.workoutCoordinator = WorkoutCoordinator(
            adServerService,
            alertHandlerService,
            userDefaultsService,
            workoutCueService,
            delegate: self)
        
        self.settingsCoordinator = SettingsCoordinator(
            adServerService,
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
        
        tabBarController.selectedIndex = 1
        
        let targetWorkoutsPerDay = userDefaultsService.integer(forKey: Constants.targetWorkoutsPerDay)
        let repsPerSet = userDefaultsService.integer(forKey: Constants.repsPerWorkout)
        let repLength = userDefaultsService.integer(forKey: Constants.repLength)
        let restLength = userDefaultsService.integer(forKey: Constants.restLength)
        let prepareLength = userDefaultsService.integer(forKey: Constants.prepareLength)
        let workoutDate = userDefaultsService.string(forKey: Constants.todaysDate)
        let totalWorkoutTime = userDefaultsService.string(forKey: Constants.totalWorkoutTime)
        
        let dateFormatter = DateFormatter()
        let today = Date()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let todayString = dateFormatter.string(from: today)
        
        if(workoutDate != todayString) {
            userDefaultsService.set(todayString, forKey: Constants.todaysDate)
            userDefaultsService.set(0, forKey: Constants.workoutsToday)
        }
        if(targetWorkoutsPerDay == 0) {
            userDefaultsService.set(3, forKey: Constants.targetWorkoutsPerDay)
        }
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
        
        if(totalWorkoutTime == nil || totalWorkoutTime!.isEmpty || totalWorkoutTime == "0 mins 0 secs") {
            let totalWorkoutTime = GlobalFunctions.calculateTotalWorkoutTime(repsPerSet, repLength, restLength, prepareLength)
            
            userDefaultsService.set(totalWorkoutTime, forKey: Constants.totalWorkoutTime)
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
