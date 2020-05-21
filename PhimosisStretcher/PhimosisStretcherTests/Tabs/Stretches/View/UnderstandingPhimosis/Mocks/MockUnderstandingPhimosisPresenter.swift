//
//  MockUnderstandingPhimosisPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockUnderstandingPhimosisPresenter: UnderstandingPhimosisPresenterProtocol, MockObjectProtocol {
    
    var getInfoCallCount = 0
    
    func resetCallCounts() {
        self.getInfoCallCount = 0
    }
    
    func getInfo() {
        getInfoCallCount += 1
    }
}
