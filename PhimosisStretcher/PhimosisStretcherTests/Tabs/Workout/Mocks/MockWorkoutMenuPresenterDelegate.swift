//
//  MockWorkoutMenuPresenterDelegate.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockWorkoutMenuPresenterDelegate: MockObjectProtocol, WorkoutMenuPresenterDelegate {
    
    var didStartWorkoutCallCount = 0
    
    func resetCallCounts() {
        self.didStartWorkoutCallCount = 0
    }

    func didStartWorkout() {
        didStartWorkoutCallCount += 1
    }
}
