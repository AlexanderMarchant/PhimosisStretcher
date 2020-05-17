//
//  MockSettingsPresenterDelegate.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockSettingsPresenterDelegate: MockObjectProtocol, SettingsPresenterDelegate {
    
    var sendEmailCallCount = 0
    var didSelectRemindersCallCount = 0
    
    func resetCallCounts() {
        self.sendEmailCallCount = 0
        self.didSelectRemindersCallCount = 0
    }
    
    func sendEmail() {
        sendEmailCallCount += 1
    }
    
    func didSelectReminders() {
        didSelectRemindersCallCount += 1
    }
}
