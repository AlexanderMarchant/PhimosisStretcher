//
//  MockStretchInfoPresenter.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockStretchInfoPresenter: MockObjectProtocol, StretchInfoPresenterProtocol {
    
    var getStretchInfoCallCount = 0
    
    func resetCallCounts() {
        self.getStretchInfoCallCount = 0
    }
    
    func getStretchInfo() {
        getStretchInfoCallCount += 1
    }
}
