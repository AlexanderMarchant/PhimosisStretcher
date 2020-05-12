//
//  MockInformationScreenPresenterView.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockInformationScreenPresenterView: InformationScreenPresenterView, MockObjectProtocol {
    
    var errorOccurredCallCount = 0
    
    func resetCallCounts() {
        self.errorOccurredCallCount = 0
    }
    
    func errorOccurred(message: String) {
        errorOccurredCallCount += 1
    }
}
