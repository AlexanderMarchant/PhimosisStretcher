//
//  MockSettingsPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockSettingsPresenter: MockObjectProtocol, SettingsPresenterProtocol {
    
    var getWorkoutSettingsCallCount = 0
    var saveChangesCallCount = 0
    var sendEmailCallCount = 0
    
    func resetCallCounts() {
        self.getWorkoutSettingsCallCount = 0
        self.saveChangesCallCount = 0
        self.sendEmailCallCount = 0
    }
    
    func getWorkoutSettings() {
        getWorkoutSettingsCallCount += 1
    }
    
    func saveChanges(repsPerWorkout: String?, repLength: String?, restLength: String?, prepareLength: String?) {
        saveChangesCallCount += 1
    }
    
    func sendEmail() {
        sendEmailCallCount += 1
    }
}
