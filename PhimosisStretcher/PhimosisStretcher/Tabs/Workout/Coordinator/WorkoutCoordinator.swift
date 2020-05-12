//
//  WorkoutCoordinator.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

protocol WorkoutCoordinatorDelegate {
}

class WorkoutCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    let alertHandlerService: AlertHandlerServiceProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    
    let delegate: WorkoutCoordinatorDelegate
    
    init(
        _ alertHandlerService: AlertHandlerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        delegate: WorkoutCoordinatorDelegate) {
        
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
        
        self.navigationController.tabBarItem = UITabBarItem(title: "Workout", image: UIImage(named: "workout-icon"), tag: 0)
        
        self.alertHandlerService = alertHandlerService
        self.userDefaultsService = userDefaultsService
        self.delegate = delegate
    }
    
    override func start() {
        self.showWorkout()
    }
    
    func showWorkout() {
        let workoutViewController = WorkoutViewController.instantiate(storyboard: "Workout")
        
        let workoutPresenter = WorkoutPresenter(
            userDefaultsService,
            with: workoutViewController,
            delegate: self)
        
        workoutViewController.workoutPresenter = workoutPresenter
        workoutViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(workoutViewController, animated: true)
    }
    
}

extension WorkoutCoordinator: WorkoutPresenterDelegate {
}
