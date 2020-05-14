//
//  SettingsPresenter.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol SettingsPresenterView {
    func didGetWorkoutSettings(_ repsPerWorkout: String, _ repLength: String, _ restLength: String, _ prepareLength: String)
    func savedChanges()
    func errorOccurred(message: String)
}

protocol SettingsPresenterDelegate {
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    let userDefaultsService: UserDefaultsServiceProtocol
    let view: SettingsPresenterView
    let delegate: SettingsPresenterDelegate
    
    init(
        _ userDefaultsService: UserDefaultsServiceProtocol,
        with view: SettingsPresenterView,
        delegate: SettingsPresenterDelegate) {
        
        self.userDefaultsService = userDefaultsService
        self.view = view
        self.delegate = delegate
    }
    
    func getWorkoutSettings() {
        let repsPerWorkout = String(userDefaultsService.integer(forKey: Constants.repsPerWorkout))
        let repLength = String(userDefaultsService.integer(forKey: Constants.repLength))
        let restLength = String(userDefaultsService.integer(forKey: Constants.restLength))
        let prepareLength = String(userDefaultsService.integer(forKey: Constants.prepareLength))
        
        self.view.didGetWorkoutSettings(repsPerWorkout, repLength, restLength, prepareLength)
    }
    
    func saveChanges(repsPerWorkout: String?, repLength: String?, restLength: String?, prepareLength: String?) {
        guard let repsPerWorkout = repsPerWorkout, let repLength = repLength, let restLength = restLength, let prepareLength = prepareLength else {
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
        
        userDefaultsService.set(Int(repsPerWorkout), forKey: Constants.repsPerWorkout)
        userDefaultsService.set(Int(repLength), forKey: Constants.repLength)
        userDefaultsService.set(Int(restLength), forKey: Constants.restLength)
        userDefaultsService.set(Int(prepareLength), forKey: Constants.prepareLength)
        
        self.view.savedChanges()
        
    }
    
}
