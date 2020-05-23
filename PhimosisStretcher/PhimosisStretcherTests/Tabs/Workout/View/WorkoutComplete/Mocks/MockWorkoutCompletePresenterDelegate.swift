//
//  MockWorkoutCompletePresenterDelegate.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockWorkoutCompletePresenterDelegate: WorkoutCompletePresenterDelegate, MockObjectProtocol {
    
    var didTapCloseCallCount = 0
    
    func resetCallCounts() {
        self.didTapCloseCallCount = 0
    }
    
    func didTapClose() {
        didTapCloseCallCount += 1
    }
    
}
