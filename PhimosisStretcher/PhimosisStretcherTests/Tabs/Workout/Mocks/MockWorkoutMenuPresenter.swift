//
//  MockWorkoutMenuPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockWorkoutMenuPresenter: MockObjectProtocol, WorkoutMenuPresenterProtocol {
    
    var getWorkoutInformationCallCount = 0
    var startWorkoutCallCount = 0
    
    func resetCallCounts() {
        self.getWorkoutInformationCallCount = 0
        self.startWorkoutCallCount = 0
    }
    
    func getWorkoutInformation() {
        getWorkoutInformationCallCount += 1
    }
    
    func startWorkout() {
        startWorkoutCallCount += 1
    }
}
