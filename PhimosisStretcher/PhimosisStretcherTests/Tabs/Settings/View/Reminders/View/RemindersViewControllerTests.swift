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

}
