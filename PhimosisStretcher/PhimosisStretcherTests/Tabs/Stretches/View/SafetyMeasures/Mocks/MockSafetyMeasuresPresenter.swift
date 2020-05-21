//
//  MockSafetyMeasuresPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockSafetyMeasuresPresenter: SafetyMeasuresPresenterProtocol, MockObjectProtocol {
    
    var getSafetyMeasuresCallCount = 0
    
    func resetCallCounts() {
        self.getSafetyMeasuresCallCount = 0
    }
    
    func getSafetyMeasures() {
        getSafetyMeasuresCallCount += 1
    }
}
