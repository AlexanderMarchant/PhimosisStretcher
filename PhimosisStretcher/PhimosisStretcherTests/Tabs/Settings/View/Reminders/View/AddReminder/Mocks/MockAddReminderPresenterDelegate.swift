//
//  MockAddReminderPresenterDelegate.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockAddReminderPresenterDelegate: AddReminderPresenterDelegate, MockObjectProtocol {
    
    var didAddReminderCallCount = 0
    
    func resetCallCounts() {
        self.didAddReminderCallCount = 0
    }
    
    func didAddReminder() {
        didAddReminderCallCount += 1
    }
}
