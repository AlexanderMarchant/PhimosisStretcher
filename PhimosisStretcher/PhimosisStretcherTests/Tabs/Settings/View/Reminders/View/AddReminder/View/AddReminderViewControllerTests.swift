//
//  AddReminderViewControllerTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class AddReminderViewControllerTests: XCTestCase {
    
    var addReminderViewController: AddReminderViewController!
    var mockAlertHandlerService: MockAlertHandlerService!
    var mockAddReminderPresenter: MockAddReminderPresenter!

    override func setUpWithError() throws {
        mockAlertHandlerService = MockAlertHandlerService()
        mockAddReminderPresenter = MockAddReminderPresenter()
        
        addReminderViewController = AddReminderViewController.instantiate(storyboard: "AddReminder")
        addReminderViewController.addReminderPresenter = mockAddReminderPresenter
        addReminderViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(addReminderViewController.view)
    }

    override func tearDownWithError() throws {
        addReminderViewController = nil
        mockAddReminderPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        addReminderViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual("Add Reminder", addReminderViewController.title)
        XCTAssertEqual(UIColor.appBlue, addReminderViewController.reminderMessageTextBoxController.activeColor)
        XCTAssertEqual("Reminder Message", addReminderViewController.reminderMessageTextBoxController.placeholderText)
    }
    
    func testAddReminder() {
        // Arrange/Act
        addReminderViewController.addReminder()
        
        // Assert
        XCTAssertEqual(1, mockAddReminderPresenter.addReminderCallCount)
    }
    
    func testAddReminderPresenterView_ErrorOccurred() {
        // Arrange/Act
        addReminderViewController.errorOccurred(message: "Error")
        
        // Assert
        XCTAssertEqual(1, mockAlertHandlerService.showWarningAlertCallCount)
    }

}
