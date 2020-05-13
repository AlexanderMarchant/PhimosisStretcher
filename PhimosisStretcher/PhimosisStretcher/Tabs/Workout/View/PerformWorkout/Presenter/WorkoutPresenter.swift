//
//  WorkoutPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol WorkoutPresenterView {
    func workoutDidResume()
    func workoutDidPause()
    func workoutDidComplete()
}

protocol WorkoutPresenterDelegate {
    func didCompleteWorkout()
}

class WorkoutPresenter: WorkoutPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let timerService: TimerServiceProtocol
    let view: WorkoutPresenterView
    let delegate: WorkoutPresenterDelegate
    
    init(
        _ userDefaultsService: UserDefaultsServiceProtocol,
        _ timerService: TimerServiceProtocol,
        with view: WorkoutPresenterView,
        delegate: WorkoutPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.timerService = timerService
        self.view = view
        self.delegate = delegate
    }
    
    func resumeWorkout() {
        // Resume the workout and timer
    }
    
    func pauseWorkout() {
        // Pause the workout and timer
    }
    
}
