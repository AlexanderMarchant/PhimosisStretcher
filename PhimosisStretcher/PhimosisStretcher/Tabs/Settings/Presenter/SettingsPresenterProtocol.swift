//
//  SettingsPresenterProtocol.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol SettingsPresenterProtocol {
    func getWorkoutSettings()
    func saveChanges(repsPerWorkout: String?, repLength: String?, restLength: String?, prepareLength: String?)
}
