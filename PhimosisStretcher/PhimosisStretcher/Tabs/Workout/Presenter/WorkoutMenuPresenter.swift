//
//  WorkoutMenuPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol WorkoutMenuPresenterView {
    func didGetWorkoutInformation(numberOfWorkoutsToday: Int, workoutTime: String)
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
        // Return worokut information
    }
    
    func startWorkout() {
        self.delegate.didStartWorkout()
    }
    
}

