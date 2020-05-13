//
//  MockTimerService.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 13/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockTimerService: TimerServiceProtocol, MockObjectProtocol {
    
    var startCallCount = 0
    var pauseCallCount = 0
    var resumeCallCount = 0
    
    func resetCallCounts() {
        self.startCallCount = 0
        self.pauseCallCount = 0
        self.resumeCallCount = 0
    }
    
    func start(delayTime: TimeInterval) {
        startCallCount += 1
    }
    
    func pause() {
        pauseCallCount += 1
    }
    
    func resume() {
        resumeCallCount += 1
    }
    
    
}
