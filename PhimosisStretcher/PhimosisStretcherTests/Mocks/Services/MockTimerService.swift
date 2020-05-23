//
//  MockTimerService.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 13/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockTimerService: TimerServiceProtocol, MockObjectProtocol {
    
    var delegate: TimerServiceDelegate?
    var timeRemaining: TimeInterval!
    var workoutTimer: Timer = Timer()
    
    var startCallCount = 0
    var startDelayTime: TimeInterval!
    var pauseCallCount = 0
    var resumeCallCount = 0
    
    func resetCallCounts() {
        self.startCallCount = 0
        self.pauseCallCount = 0
        self.resumeCallCount = 0
    }
    
    func start(delayTime: TimeInterval) {
        startCallCount += 1
        startDelayTime = delayTime
    }
    
    func pause() {
        pauseCallCount += 1
    }
    
    func resume() {
        resumeCallCount += 1
    }
    
    
}
