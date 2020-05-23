//
//  MockReminderPresenter.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockRemindersPresenter: RemindersPresenterProtocol, MockObjectProtocol {
    
    var addReminderCallCount = 0
    var deleteReminderCallCount = 0
    var getRemindersCallCount = 0
    
    func resetCallCounts() {
        self.addReminderCallCount = 0
        self.deleteReminderCallCount = 0
        self.getRemindersCallCount = 0
    }
    
    func addReminder() {
        addReminderCallCount += 1
    }
    
    func deleteReminder(reminders: [Reminder], deleteAt reminderIndex: Int) {
        deleteReminderCallCount += 1
    }
    
    func getReminders() {
        getRemindersCallCount += 1
    }
}
