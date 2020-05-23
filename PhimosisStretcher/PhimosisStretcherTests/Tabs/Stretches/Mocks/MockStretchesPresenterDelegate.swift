//
//  MockStretchesPresenterDelegate.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockStretchesPresenterDelegate: MockObjectProtocol, StretchesPresenterDelegate {
    
    var didSelectStretchCallCount = 0
    var didSelectUnderstandingPhimosisCallCount = 0
    var didSelectSafetyMeasuresCallCount = 0
    
    func resetCallCounts() {
        self.didSelectStretchCallCount = 0
        self.didSelectUnderstandingPhimosisCallCount = 0
        self.didSelectSafetyMeasuresCallCount = 0
    }
    
    func didSelectStretch(_ selectedStretch: StretchInfo) {
        didSelectStretchCallCount += 1
    }
    
    func didSelectUnderstandingPhimosis(_ understandingPhimosis: UnderstandingPhimosis) {
        didSelectUnderstandingPhimosisCallCount += 1
    }
    
    func didSelectSafetyMeasures(_ safetyMeasures: SafetyMeasures) {
        didSelectSafetyMeasuresCallCount += 1
    }
}
