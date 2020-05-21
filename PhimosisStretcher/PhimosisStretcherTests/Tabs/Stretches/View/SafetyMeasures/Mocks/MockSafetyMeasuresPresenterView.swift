//
//  MockSafetyMeasuresPresenterView.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockSafetyMeasuresPresenterView: SafetyMeasuresPresenterView, MockObjectProtocol {
    
    var didGetSafetyMeasuresCallCount = 0
    
    func resetCallCounts() {
        self.didGetSafetyMeasuresCallCount = 0
    }
    
    func didGetSafetyMeasures(_ safetyMeasures: SafetyMeasures) {
        didGetSafetyMeasuresCallCount += 1
    }
}
