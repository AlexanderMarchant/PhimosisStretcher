//
//  MockSettingsPresenterView.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockSettingsPresenterView: MockObjectProtocol, SettingsPresenterView {
    
    var didGetWorkoutSettingsCallCount = 0
    var savedChangesCallCount = 0
    var errorOccurredCallCount = 0
    
    func resetCallCounts() {
        self.didGetWorkoutSettingsCallCount = 0
        self.savedChangesCallCount = 0
        self.errorOccurredCallCount = 0
    }
    
    func didGetWorkoutSettings(_ repsPerWorkout: String, _ repLength: String, _ restLength: String, _ prepareLength: String) {
        didGetWorkoutSettingsCallCount += 1
    }
    
    func savedChanges() {
        savedChangesCallCount += 1
    }
    
    func errorOccurred(message: String) {
        errorOccurredCallCount += 1
    }
}
