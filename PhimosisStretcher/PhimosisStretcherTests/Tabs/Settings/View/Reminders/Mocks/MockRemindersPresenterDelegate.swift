//
//  MockReminderPresenterDelegate.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockRemindersPresenterDelegate: RemindersPresenterDelegate, MockObjectProtocol {
    
    var didTapAddReminderCallCount = 0
    
    func resetCallCounts() {
        self.didTapAddReminderCallCount = 0
    }
    
    func didTapAddReminder() {
        didTapAddReminderCallCount += 1
    }
}
