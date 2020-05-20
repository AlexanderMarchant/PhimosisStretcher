//
//  MockStretchInfoPresenterView.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockStretchInfoPresenterView: MockObjectProtocol, StretchInfoPresenterView {
    
    var didGetStretchInfoCallCount = 0
    
    func resetCallCounts() {
        self.didGetStretchInfoCallCount = 0
    }
    
    func didGetStretchInfo(_ stretchInfo: StretchInfo) {
        didGetStretchInfoCallCount += 1
    }
}
