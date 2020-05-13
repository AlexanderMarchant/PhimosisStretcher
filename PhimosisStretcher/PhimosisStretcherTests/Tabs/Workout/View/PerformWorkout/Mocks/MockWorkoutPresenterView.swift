//
//  MockWorkoutPresenterView.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockWorkoutPresenterView: MockObjectProtocol, WorkoutPresenterView {
    
    var workoutDidResumeCallCount = 0
    var workoutDidPauseCallCount = 0
    var workoutDidCompleteCallCount = 0
    
    func resetCallCounts() {
        self.workoutDidResumeCallCount = 0
        self.workoutDidPauseCallCount = 0
        self.workoutDidCompleteCallCount = 0
    }
    
    
    func workoutDidResume() {
        workoutDidResumeCallCount += 1
    }
    
    func workoutDidPause() {
        workoutDidPauseCallCount += 1
    }
    
    func workoutDidComplete() {
        workoutDidCompleteCallCount += 1
    }
}


