//
//  WorkoutMenuPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol WorkoutMenuPresenterView {
    func didGetWorkoutInformation(_ numberOfWorkoutsToday: Int, _ targetWorkoutsPerDay: Int, _ workoutTime: String)
}

protocol WorkoutMenuPresenterDelegate {
    func didStartWorkout()
}

class WorkoutMenuPresenter: WorkoutMenuPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let view: WorkoutMenuPresenterView
    let delegate: WorkoutMenuPresenterDelegate
    
    init(
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: WorkoutMenuPresenterView,
        delegate: WorkoutMenuPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.view = view
        self.delegate = delegate
    }
    
    func getWorkoutInformation() {
        
        let targetWorkoutsPerDay = userDefaultsService.integer(forKey: Constants.targetWorkoutsPerDay)
        let workoutsToday = userDefaultsService.integer(forKey: Constants.workoutsToday)
        let workoutTime = userDefaultsService.string(forKey: Constants.totalWorkoutTime) ?? "Not Set"
        
        self.view.didGetWorkoutInformation(workoutsToday, targetWorkoutsPerDay, workoutTime)
    }
    
    func startWorkout() {
        self.delegate.didStartWorkout()
    }
    
}

