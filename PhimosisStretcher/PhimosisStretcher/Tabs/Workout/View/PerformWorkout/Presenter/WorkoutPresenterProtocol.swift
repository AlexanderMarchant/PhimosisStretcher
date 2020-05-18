//
//  WorkoutPresenterProtocol.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol WorkoutPresenterProtocol: AdvertScreenPresenterProtocol {
    func beginWorkout()
    func resumeWorkout()
    func pauseWorkout()
    func closeWorkout()
}
