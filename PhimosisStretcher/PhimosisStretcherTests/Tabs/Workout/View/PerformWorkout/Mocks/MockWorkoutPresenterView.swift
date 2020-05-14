//
//  MockWorkoutPresenterView.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit
@testable import PhimosisStretcher

class MockWorkoutPresenterView: MockObjectProtocol, WorkoutPresenterView {
    
    var workoutDidResumeCallCount = 0
    var workoutDidPauseCallCount = 0
    var workoutDidCompleteCallCount = 0
    var timeStringDidUpdateCallCount = 0
    var timeString = ""
    var instructionDidUpdateCallCount = 0
    var didCompleteRepCallCount = 0
    
    func resetCallCounts() {
        self.workoutDidResumeCallCount = 0
        self.workoutDidPauseCallCount = 0
        self.workoutDidCompleteCallCount = 0
        self.timeStringDidUpdateCallCount = 0
        self.instructionDidUpdateCallCount = 0
        self.didCompleteRepCallCount = 0
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
    
    func timeStringDidUpdate(_ time: String) {
        timeStringDidUpdateCallCount += 1
        timeString = time
    }
    
    func instructionDidUpdate(instruction: String, backgroundColor: UIColor) {
        instructionDidUpdateCallCount += 1
    }
    
    func didCompleteRep(repsLeft: Int) {
        didCompleteRepCallCount += 1
    }
}


