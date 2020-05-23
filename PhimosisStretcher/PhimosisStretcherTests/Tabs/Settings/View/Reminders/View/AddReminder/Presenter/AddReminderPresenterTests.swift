//
//  AddReminderPresenterTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class AddReminderPresenterTests: XCTestCase {
    
    var addReminderPresenter: AddReminderPresenter!
    var mockAddReminderPresenterView: MockAddReminderPresenterView!
    var mockAddReminderPresenterDelegate: MockAddReminderPresenterDelegate!

    override func setUpWithError() throws {
        mockAddReminderPresenterView = MockAddReminderPresenterView()
        mockAddReminderPresenterDelegate = MockAddReminderPresenterDelegate()
        
        addReminderPresenter = AddReminderPresenter(
            with: mockAddReminderPresenterView,
            delegate: mockAddReminderPresenterDelegate)
    }

    override func tearDownWithError() throws {
        addReminderPresenter = nil
        mockAddReminderPresenterView = nil
        mockAddReminderPresenterDelegate = nil
    }
    
    func testAddReminder() {
        // Arrange/Act
        addReminderPresenter.addReminder(time: Date(), message: "", useSound: false)
        
        // Assert
        XCTAssertEqual(1, mockAddReminderPresenterDelegate.didAddReminderCallCount)
    }

}
