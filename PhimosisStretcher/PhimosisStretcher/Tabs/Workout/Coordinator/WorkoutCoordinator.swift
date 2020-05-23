//
//  WorkoutCoordinator.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

protocol WorkoutCoordinatorDelegate {
}

class WorkoutCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    let adServerService: AdServerServiceProtocol
    let alertHandlerService: AlertHandlerServiceProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    let workoutCueService: WorkoutCueServiceProtocol
    
    let delegate: WorkoutCoordinatorDelegate
    
    init(
        _ adServerService: AdServerServiceProtocol,
        _ alertHandlerService: AlertHandlerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        _ workoutCueService: WorkoutCueServiceProtocol,
        delegate: WorkoutCoordinatorDelegate) {
        
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
        
        self.navigationController.tabBarItem = UITabBarItem(title: "Workout", image: UIImage(named: "workout-icon"), tag: 0)
        
        self.adServerService = adServerService
        self.alertHandlerService = alertHandlerService
        self.userDefaultsService = userDefaultsService
        self.workoutCueService = workoutCueService
        self.delegate = delegate
    }
    
    override func start() {
        self.showWorkoutMenu()
    }
    
    func showWorkoutMenu() {
        let workoutMenuViewController = WorkoutMenuViewController.instantiate(storyboard: "WorkoutMenu")
        
        let workoutMenuPresenter = WorkoutMenuPresenter(
            adServerService,
            userDefaultsService,
            with: workoutMenuViewController,
            delegate: self)
        
        workoutMenuViewController.advertScreenPresenter = workoutMenuPresenter
        workoutMenuViewController.workoutMenuPresenter = workoutMenuPresenter
        workoutMenuViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.addChild(workoutMenuViewController)
    }
    
    func showWashYourHands() {
        let washYourHandsViewController = WashYourHandsViewController.instantiate(storyboard: "WashYourHands")
        
        let washYourHandsPresenter = WashYourHandsPresenter(
            adServerService,
            with: washYourHandsViewController,
            delegate: self)
        
        washYourHandsViewController.advertScreenPresenter = washYourHandsPresenter
        washYourHandsViewController.informationScreenPresenter = washYourHandsPresenter
        washYourHandsViewController.washYourHandsPresenter = washYourHandsPresenter
        washYourHandsViewController.alertHandlerService = alertHandlerService
        
        navigationController.pushViewController(washYourHandsViewController, animated: true)
    }
    
    func showWorkout() {
        let workoutViewController = WorkoutViewController.instantiate(storyboard: "Workout")
        
        let workoutPresenter = WorkoutPresenter(
            adServerService,
            userDefaultsService,
            workoutCueService,
            TimerService(),
            with: workoutViewController,
            delegate: self)
        
        workoutViewController.advertScreenPresenter = workoutPresenter
        workoutViewController.workoutPresenter = workoutPresenter
        workoutViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(workoutViewController, animated: true)
    }
    
    func showWorkoutComplete() {
        let workoutCompleteViewController = WorkoutCompleteViewController.instantiate(storyboard: "WorkoutComplete")
        
        let workoutCompletePresenter = WorkoutCompletePresenter(
            adServerService,
            userDefaultsService,
            with: workoutCompleteViewController,
            delegate: self)
        
        workoutCompleteViewController.advertScreenPresenter = workoutCompletePresenter
        workoutCompleteViewController.informationScreenPresenter = workoutCompletePresenter
        workoutCompleteViewController.workoutCompletePresenter = workoutCompletePresenter
        workoutCompleteViewController.alertHandlerService = alertHandlerService
        
        navigationController.pushViewController(workoutCompleteViewController, animated: true)
    }
    
}

extension WorkoutCoordinator: WorkoutMenuPresenterDelegate {
    func didStartWorkout() {
        showWashYourHands()
    }
}

extension WorkoutCoordinator: WashYourHandsPresenterDelegate {
    func didTapContinue() {
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
