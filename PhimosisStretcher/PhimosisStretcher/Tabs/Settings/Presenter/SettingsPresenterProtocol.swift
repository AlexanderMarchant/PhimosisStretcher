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
    func getCueSettings()
    func saveChanges(targetWorkoutsPerDay: String?, repsPerWorkout: String?, repLength: String?, restLength: String?, prepareLength: String?)
    func sendEmail()
    func didSelectReminders()
    func getNotificationSettings()
    func updateVibrateCue()
    func updateVisualCue()
    func updateAudioCue()
}
