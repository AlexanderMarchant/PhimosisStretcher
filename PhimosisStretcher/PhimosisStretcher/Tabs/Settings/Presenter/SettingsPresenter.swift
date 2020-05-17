//
//  SettingsPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import MessageUI

protocol SettingsPresenterView {
    func didGetWorkoutSettings(_ targetWorkoutsPerDay: String, _ repsPerWorkout: String, _ repLength: String, _ restLength: String, _ prepareLength: String)
    func didGetCueSettings(_ useVibrateCues: Bool, _ useVisualCues: Bool, _ useAudioCues: Bool)
    func savedChanges()
    func errorOccurred(message: String)
}

protocol SettingsPresenterDelegate {
    func sendEmail()
    func didSelectReminders()
    func didSelectCredits()
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let view: SettingsPresenterView
    let delegate: SettingsPresenterDelegate
    
    var notificationsAreEnabled: Bool = false
    
    init(
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: SettingsPresenterView,
        delegate: SettingsPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.view = view
        self.delegate = delegate
    }
    
    func getWorkoutSettings() {
        let targetWorkoutsPerDay = String(userDefaultsService.integer(forKey: Constants.targetWorkoutsPerDay))
        let repsPerWorkout = String(userDefaultsService.integer(forKey: Constants.repsPerWorkout))
        let repLength = String(userDefaultsService.integer(forKey: Constants.repLength))
        let restLength = String(userDefaultsService.integer(forKey: Constants.restLength))
        let prepareLength = String(userDefaultsService.integer(forKey: Constants.prepareLength))
        
        self.view.didGetWorkoutSettings(targetWorkoutsPerDay, repsPerWorkout, repLength, restLength, prepareLength)
    }
    
    func getCueSettings() {
        let useVibrateCues = userDefaultsService.bool(forKey: Constants.useVibrateCues)
        let useVisualCues = userDefaultsService.bool(forKey: Constants.useVisualCues)
        let useAudioCues = userDefaultsService.bool(forKey: Constants.useAudioCues)
        
        self.view.didGetCueSettings(useVibrateCues, useVisualCues, useAudioCues)
    }
    
    func saveChanges(targetWorkoutsPerDay: String?, repsPerWorkout: String?, repLength: String?, restLength: String?, prepareLength: String?) {
        guard let targetWorkoutsPerDay = targetWorkoutsPerDay, let repsPerWorkout = repsPerWorkout, let repLength = repLength, let restLength = restLength, let prepareLength = prepareLength else {
            self.view.errorOccurred(message: "Please enter a value for all workout settings")
            return
        }
        
        if(repsPerWorkout.isEmpty || repLength.isEmpty || restLength.isEmpty || prepareLength.isEmpty) {
            self.view.errorOccurred(message: "Please enter a value for all workout settings")
            return
        }
        
        if(!repsPerWorkout.isInt || !repLength.isInt || !restLength.isInt || !prepareLength.isInt) {
            self.view.errorOccurred(message: "Please enter a numeric value for all workout settings")
            return
        }
        
        let targetWorkoutsPerDayInt = Int(targetWorkoutsPerDay)
        let repsPerWorkoutInt = Int(repsPerWorkout)
        let repLengthInt = Int(repLength)
        let restLengthInt = Int(restLength)
        let prepareLengthInt = Int(prepareLength)
        
        let totalWorkoutTime = GlobalFunctions.calculateTotalWorkoutTime(repsPerWorkoutInt!, repLengthInt!, restLengthInt!, prepareLengthInt!)
        
        userDefaultsService.set(targetWorkoutsPerDayInt, forKey: Constants.targetWorkoutsPerDay)
        userDefaultsService.set(repsPerWorkoutInt, forKey: Constants.repsPerWorkout)
        userDefaultsService.set(repLengthInt, forKey: Constants.repLength)
        userDefaultsService.set(restLengthInt, forKey: Constants.restLength)
        userDefaultsService.set(prepareLengthInt, forKey: Constants.prepareLength)
        userDefaultsService.set(totalWorkoutTime, forKey: Constants.totalWorkoutTime)
        
        self.view.savedChanges()
        
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            self.delegate.sendEmail()
        } else {
            self.view.errorOccurred(message: "In order to send an email through the app, you must first connect an email to the mail app. \n \n Email: \n \(Constants.email)")
        }
    }
    
    func didSelectReminders() {
        if(notificationsAreEnabled) {
            self.delegate.didSelectReminders()
        } else {
            ErrorScreensCoordinator.shared.showEnableNotifications()
        }
    }
    
    func didSelectCredits() {
        self.delegate.didSelectCredits()
    }
    
    func updateVibrateCue() {
        let useVibrateCues = userDefaultsService.bool(forKey: Constants.useVibrateCues)
        userDefaultsService.set(!useVibrateCues, forKey: Constants.useVibrateCues)
    }
    
    func updateVisualCue() {
        let useVisualCues = userDefaultsService.bool(forKey: Constants.useVisualCues)
        userDefaultsService.set(!useVisualCues, forKey: Constants.useVisualCues)
    }
    
    func updateAudioCue() {
        let useAudioCues = userDefaultsService.bool(forKey: Constants.useAudioCues)
        userDefaultsService.set(!useAudioCues, forKey: Constants.useAudioCues)
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            if(settings.authorizationStatus != .authorized) {
                self.notificationsAreEnabled = false
            } else {
                self.notificationsAreEnabled = true
            }
        }
    }
    
}
