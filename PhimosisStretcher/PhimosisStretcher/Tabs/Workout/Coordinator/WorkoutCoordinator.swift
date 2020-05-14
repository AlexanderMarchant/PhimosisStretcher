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
    let timerService: TimerServiceProtocol
    
    let delegate: WorkoutCoordinatorDelegate
    
    init(
        _ alertHandlerService: AlertHandlerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        _ timerService: TimerServiceProtocol,
        delegate: WorkoutCoordinatorDelegate) {
        
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
        
        self.navigationController.tabBarItem = UITabBarItem(title: "Workout", image: UIImage(named: "workout-icon"), tag: 0)
        
        self.alertHandlerService = alertHandlerService
        self.userDefaultsService = userDefaultsService
        self.timerService = timerService
        self.delegate = delegate
    }
    
    override func start() {
        self.showWorkoutMenu()
    }
    
    func showWorkoutMenu() {
        let workoutMenuViewController = WorkoutMenuViewController.instantiate(storyboard: "WorkoutMenu")
        
        let workoutMenuPresenter = WorkoutMenuPresenter(
            userDefaultsService,
            with: workoutMenuViewController,
            delegate: self)
        
        workoutMenuViewController.workoutMenuPresenter = workoutMenuPresenter
        workoutMenuViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(workoutMenuViewController, animated: true)
    }
    
    func showWorkout() {
        let workoutViewController = WorkoutViewController.instantiate(storyboard: "Workout")
        
        let workoutPresenter = WorkoutPresenter(
            userDefaultsService,
            timerService,
            with: workoutViewController,
            delegate: self)
        
        workoutViewController.workoutPresenter = workoutPresenter
        workoutViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(workoutViewController, animated: true)
    }
    
    func showWorkoutComplete() {
        let workoutCompleteViewController = WorkoutCompleteViewController.instantiate(storyboard: "WorkoutComplete")
        
        let workoutCompletePresenter = WorkoutCompletePresenter(
            with: workoutCompleteViewController,
            delegate: self)
        
        workoutCompleteViewController.informationScreenPresenter = workoutCompletePresenter
        workoutCompleteViewController.workoutCompletePresenter = workoutCompletePresenter
        workoutCompleteViewController.alertHandlerService = alertHandlerService
        
        navigationController.pushViewController(workoutCompleteViewController, animated: true)
    }
    
}

extension WorkoutCoordinator: WorkoutMenuPresenterDelegate {
    func didStartWorkout() {
        showWorkout()
    }
}

extension WorkoutCoordinator: WorkoutPresenterDelegate {
    func didCompleteWorkout() {
        self.showWorkoutComplete()
    }
    
    func didCancelWorkout() {
        self.navigationController.popToRootViewController(animated: true)
    }
}

extension WorkoutCoordinator: WorkoutCompletePresenterDelegate {
    func didTapClose() {
        self.navigationController.popToRootViewController(animated: true)
    }
}
