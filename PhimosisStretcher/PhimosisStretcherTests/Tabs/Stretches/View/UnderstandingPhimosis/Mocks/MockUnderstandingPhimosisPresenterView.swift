//
//  MockUnderstandingPhimosisPresenterView.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockUnderstandingPhimosisPresenterView: UnderstandingPhimosisPresenterView, MockObjectProtocol {
    
    var didGetInfoCallCount = 0
    
    func resetCallCounts() {
        self.didGetInfoCallCount = 0
    }
    
    func didGetInfo(_ understandingPhimosis: UnderstandingPhimosis) {
        didGetInfoCallCount += 1
    }
}
