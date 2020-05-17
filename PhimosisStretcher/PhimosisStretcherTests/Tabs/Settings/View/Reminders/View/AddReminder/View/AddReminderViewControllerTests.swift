//
//  AddReminderViewControllerTests.swift
//  PhimosisStretcherTests
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

}
