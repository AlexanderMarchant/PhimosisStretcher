//
//  MockEnableNotificationsPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockEnableNotificationsPresenter: EnableNotificationsPresenterProtocol, MockObjectProtocol {
    
    var didTapEnableNotificationsCallCount = 0
    var didTapCloseCallCount = 0
    
    func resetCallCounts() {
        self.didTapEnableNotificationsCallCount = 0
        self.didTapCloseCallCount = 0
    }
    
    func didTapEnableNotifications() {
        didTapEnableNotificationsCallCount += 1
    }
    
    func didTapClose() {
        didTapCloseCallCount += 1
    }
    
}
