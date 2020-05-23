//
//  MockRemindersPresenterView.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockRemindersPresenterView: RemindersPresenterView, MockObjectProtocol {
    
    var didGetRemindersCallCount = 0
    var errorOccurredCallCount = 0
    
    func resetCallCounts() {
        self.didGetRemindersCallCount = 0
        self.errorOccurredCallCount = 0
    }
    
    func didGetReminders(reminders: [Reminder]) {
        didGetRemindersCallCount += 1
    }
    
    func errorOccurred(message: String) {
        errorOccurredCallCount += 1
    }
}
