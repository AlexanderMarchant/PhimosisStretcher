//
//  MockWashYourHandsPresenterDelegate.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockWashYourHandsPresenterDelegate: WashYourHandsPresenterDelegate, MockObjectProtocol {
    
    var didTapContinueCallCount = 0
    var didTapCloseCallCount = 0
    
    func resetCallCounts() {
        self.didTapCloseCallCount = 0
        self.didTapContinueCallCount = 0
    }
    
    func didTapContinue() {
        didTapContinueCallCount += 1
    }
    
    func didTapClose() {
        didTapCloseCallCount += 1
    }
    
}

