//
//  MockStretchesPresenterDelegate.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockStretchesPresenterDelegate: MockObjectProtocol, StretchesPresenterDelegate {
    
    var didSelectStretchCallCount = 0
    
    func resetCallCounts() {
        self.didSelectStretchCallCount = 0
    }
    
    func didSelectStretch() {
        didSelectStretchCallCount += 1
    }
}
