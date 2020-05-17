//
//  MockAddReminderPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockAddReminderPresenter: AddReminderPresenterProtocol, MockObjectProtocol {
    
    var addReminderCallCount = 0
    
    func resetCallCounts() {
        self.addReminderCallCount = 0
    }
    
    func addReminder(time: Date, message: String?, useSound: Bool) {
        addReminderCallCount += 1
    }
}
