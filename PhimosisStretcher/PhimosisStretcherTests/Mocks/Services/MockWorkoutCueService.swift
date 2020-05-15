//
//  MockWorkoutCueService.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockWorkoutCueService: WorkoutCueServiceProtocol, MockObjectProtocol {
    
    var playBeginAudioCueCallCount = 0
    var playRestAudioCueCallCount = 0
    var playWorkoutCompleteAudioCueCallCount = 0
    var playVibrateCueCallCount = 0
    
    func resetCallCounts() {
        self.playBeginAudioCueCallCount = 0
        self.playRestAudioCueCallCount = 0
        self.playWorkoutCompleteAudioCueCallCount = 0
        self.playVibrateCueCallCount = 0
    }
    
    func playBeginAudioCue() {
        playBeginAudioCueCallCount += 1
    }
    
    func playRestAudioCue() {
        playRestAudioCueCallCount += 1
    }
    
    func playWorkoutCompleteAudioCue() {
        playWorkoutCompleteAudioCueCallCount += 1
    }
    
    func playVibrateCue() {
        playVibrateCueCallCount += 1
    }
}
