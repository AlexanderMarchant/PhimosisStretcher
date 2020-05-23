//
//  RemindersPresenterTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class RemindersPresenterTests: XCTestCase {
    
    var remindersPresenter: RemindersPresenter!
    var mockRemindersPresenterView: MockRemindersPresenterView!
    var mockRemindersPresenterDelegate: MockRemindersPresenterDelegate!

    override func setUpWithError() throws {
        mockRemindersPresenterView = MockRemindersPresenterView()
        mockRemindersPresenterDelegate = MockRemindersPresenterDelegate()
        
        remindersPresenter = RemindersPresenter(
            with: mockRemindersPresenterView,
            delegate: mockRemindersPresenterDelegate)
    }

    override func tearDownWithError() throws {
        remindersPresenter = nil
        mockRemindersPresenterView = nil
        mockRemindersPresenterDelegate = nil
    }
    
    func testAddReminder() {
        // Arrange/Act
        remindersPresenter.addReminder()
        
        // Assert
        XCTAssertEqual(1, mockRemindersPresenterDelegate.didTapAddReminderCallCount)
    }
    
    func testDeleteReminder_IndexOutOfRange() {
        // Arrange
        let INDEX = 4
        
        let REMINDERS = [
            Reminder(identifier: "1", time: Date(), message: "", withSound: true, isAPendingNotification: true),
            Reminder(identifier: "2", time: Date(), message: "", withSound: true, isAPendingNotification: true),
            Reminder(identifier: "3", time: Date(), message: "", withSound: true, isAPendingNotification: true),
        ]
        
        // Act
        remindersPresenter.deleteReminder(reminders: REMINDERS, deleteAt: INDEX)
        
        // Assert
        XCTAssertEqual(0, mockRemindersPresenterView.didGetRemindersCallCount)
        XCTAssertEqual(1, mockRemindersPresenterView.errorOccurredCallCount)
    }
    
    func testDeleteReminder_Success() {
        // Arrange
        let INDEX = 0
        
        let REMINDERS = [
            Reminder(identifier: "fjdkasjfkdsajkfd", time: Date(), message: "", withSound: true, isAPendingNotification: true),
            Reminder(identifier: "fjdkasjfkdsajkfd", time: Date(), message: "", withSound: true, isAPendingNotification: true),
            Reminder(identifier: "fjdkasjfkdsajkfd", time: Date(), message: "", withSound: true, isAPendingNotification: true),
        ]
        
        // Act
        remindersPresenter.deleteReminder(reminders: REMINDERS, deleteAt: INDEX)
        
        // Assert
        XCTAssertEqual(1, mockRemindersPresenterView.didGetRemindersCallCount)
        XCTAssertEqual(0, mockRemindersPresenterView.errorOccurredCallCount)
    }

}
