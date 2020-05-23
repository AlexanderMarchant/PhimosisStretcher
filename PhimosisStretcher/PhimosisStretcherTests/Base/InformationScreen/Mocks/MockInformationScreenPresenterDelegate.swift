//
//  MockInformationScreenPresenterDelegate.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockInformationScreenPresenterDelegate: InformationScreenPresenterDelegate, MockObjectProtocol {
    
    var didTapCloseCallCount = 0
    
    func resetCallCounts() {
        self.didTapCloseCallCount = 0
    }
    
    func didTapClose() {
        didTapCloseCallCount += 1
    }
}
