//
//  WorkoutMenuPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

protocol WorkoutMenuPresenterView: AdvertScreenPresenterView {
    func didGetWorkoutInformation(_ numberOfWorkoutsToday: Int, _ targetWorkoutsPerDay: Int, _ workoutTime: String)
}

protocol WorkoutMenuPresenterDelegate: AdvertScreenPresenterDelegate {
    func didStartWorkout()
}

class WorkoutMenuPresenter: AdvertScreenPresenter, WorkoutMenuPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let workoutMenuView: WorkoutMenuPresenterView
    let workoutMenuDelegate: WorkoutMenuPresenterDelegate
    
    init(
        _ adServerService: AdServerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: WorkoutMenuPresenterView,
        delegate: WorkoutMenuPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.workoutMenuView = view
        self.workoutMenuDelegate = delegate
        
        super.init(
            adServerService,
            with: view,
            delegate: delegate)
    }
    
    func getWorkoutInformation() {
        
        let targetWorkoutsPerDay = userDefaultsService.integer(forKey: Constants.targetWorkoutsPerDay)
        let workoutsToday = userDefaultsService.integer(forKey: Constants.workoutsToday)
        let workoutTime = userDefaultsService.string(forKey: Constants.totalWorkoutTime) ?? "Not Set"
        
        self.workoutMenuView.didGetWorkoutInformation(workoutsToday, targetWorkoutsPerDay, workoutTime)
    }
    
    func startWorkout() {
        self.workoutMenuDelegate.didStartWorkout()
    }
    
    func displayInterstitialAd(viewController: UIViewController) {
        super.getInterstitialAd(viewController: viewController)
    }
    
}

