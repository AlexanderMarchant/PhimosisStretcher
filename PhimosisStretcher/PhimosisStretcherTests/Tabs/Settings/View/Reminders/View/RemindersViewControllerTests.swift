//
//  RemindersViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class RemindersViewControllerTests: XCTestCase {
    
    var remindersViewController: RemindersViewController!
    var mockAlertHandlerService: MockAlertHandlerService!
    var mockRemindersPresenter: MockRemindersPresenter!

    override func setUpWithError() throws {
        mockAlertHandlerService = MockAlertHandlerService()
        mockRemindersPresenter = MockRemindersPresenter()
        
        remindersViewController = RemindersViewController.instantiate(storyboard: "Reminders")
        remindersViewController.remindersPresenter = mockRemindersPresenter
        remindersViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(remindersViewController.view)
        
        mockRemindersPresenter.resetCallCounts()
        mockAlertHandlerService.resetCallCounts()
    }

    override func tearDownWithError() throws {
        remindersViewController = nil
        mockRemindersPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        remindersViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual("Reminders", remindersViewController.title)
        
        XCTAssertTrue(remindersViewController.tableView.emptyDataSetDelegate is RemindersViewController)
        XCTAssertTrue(remindersViewController.tableView.emptyDataSetSource is RemindersViewController)
    }
    
    func testViewWillAppear() {
        // Arrange/Act
        remindersViewController.viewWillAppear(true)
        
        // Assert
        XCTAssertEqual(1, mockRemindersPresenter.getRemindersCallCount)
    }
    
    func testNumberOfRowsInSection() {
        // Arrange
        let REMINDERS = [
            Reminder(identifier: "1", time: Date(), message: "", withSound: true, isAPendingNotification: true),
            Reminder(identifier: "2", time: Date(), message: "", withSound: true, isAPendingNotification: true),
            Reminder(identifier: "3", time: Date(), message: "", withSound: true, isAPendingNotification: true),
        ]
        
        remindersViewController.reminders = REMINDERS
        
        // Act
        let result = remindersViewController.tableView(remindersViewController.tableView, numberOfRowsInSection: 0)
        
        // Assert
        XCTAssertEqual(3, result)
    }
    
    func testCellForRowAt() {
        // Arrange
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let INDEX_PATH = IndexPath(row: 0, section: 0)
        let MESSAGE = "Test"
        let REMINDER_DATE = formatter.date(from: "2020/03/28 08:15")!
        
        let REMINDERS = [
            Reminder(identifier: "1", time: REMINDER_DATE, message: MESSAGE, withSound: true, isAPendingNotification: true),
            Reminder(identifier: "2", time: Date(), message: "", withSound: true, isAPendingNotification: true),
            Reminder(identifier: "3", time: Date(), message: "", withSound: true, isAPendingNotification: true),
        ]
        
        remindersViewController.reminders = REMINDERS
        
        // Act
        let returnedCell = remindersViewController.tableView(remindersViewController.tableView, cellForRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertEqual("08:15", returnedCell.textLabel!.text)
    }
    
    func testCommitEdit_NotDeleting() {
        // Arrange/Act
        remindersViewController.tableView(
            remindersViewController.tableView,
            commit: UITableViewCell.EditingStyle.insert,
            forRowAt: IndexPath(row: 0, section: 0))
        
        // Assert
        XCTAssertEqual(0, mockRemindersPresenter.deleteReminderCallCount)
    }
    
    func testCommitEdit_Deleting() {
        // Arrange/Act
        remindersViewController.tableView(
            remindersViewController.tableView,
            commit: UITableViewCell.EditingStyle.delete,
            forRowAt: IndexPath(row: 0, section: 0))
        
        // Assert
        XCTAssertEqual(1, mockRemindersPresenter.deleteReminderCallCount)
    }
    
    func testAddReminder() {
        // Arrange/Act
        remindersViewController.addReminder()
        
        // Assert
        XCTAssertEqual(1, mockRemindersPresenter.addReminderCallCount)
    }
    
    func testRemindersPresenterView_DidGetReminders() {
        // Arrange
        let REMINDERS = [
            Reminder(identifier: "1", time: Date(), message: "", withSound: true, isAPendingNotification: true),
            Reminder(identifier: "2", time: Date(), message: "", withSound: true, isAPendingNotification: true),
            Reminder(identifier: "3", time: Date(), message: "", withSound: true, isAPendingNotification: true),
        ]
        
        // Act
        remindersViewController.didGetReminders(reminders: REMINDERS)
        
        // Assert
        XCTAssertEqual(REMINDERS, remindersViewController.reminders)
        XCTAssertEqual(3, remindersViewController.tableView(remindersViewController.tableView, numberOfRowsInSection: 0))
    }
    
    func testRemindersPresenterView_ErrorOccurred() {
        // Arrange/Act
        remindersViewController.errorOccurred(message: "Error")
        
        // Assert
        XCTAssertEqual(1, mockAlertHandlerService.showWarningAlertCallCount)
    }
    
    func testDZNEmpty_Title() {
        // Arrange/Act
        let result = remindersViewController.title(forEmptyDataSet: remindersViewController.tableView)
        
        // Assert
        XCTAssertEqual("No Reminders Setup", result!.string)
    }
    
    func testDZNEmpty_Description() {
        // Arrange/Act
        let result = remindersViewController.description(forEmptyDataSet: remindersViewController.tableView)
        
        // Assert
        XCTAssertEqual("You have not setup any reminders yet.", result!.string)
    }

}
