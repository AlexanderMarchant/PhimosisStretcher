//
//  EnableNotificationsViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class EnableNotificationsViewControllerTests: XCTestCase {

    var enableNotificationsViewController: EnableNotificationsViewController!
    var mockEnableNotificationsPresenter: MockEnableNotificationsPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUp(){
        mockEnableNotificationsPresenter = MockEnableNotificationsPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        enableNotificationsViewController = EnableNotificationsViewController.instantiate(storyboard: "EnableNotifications")
        
        enableNotificationsViewController.informationScreenPresenter = mockEnableNotificationsPresenter
        enableNotificationsViewController.enableNotificationsPresenter = mockEnableNotificationsPresenter
        enableNotificationsViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(enableNotificationsViewController.view)
    }

    override func tearDown() {
        enableNotificationsViewController = nil
        mockEnableNotificationsPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange
        let ENABLE_NOTIFICATIONS_IMAGE = UIImage(named: "enable-notifications", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        
        // Act
        enableNotificationsViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual(ENABLE_NOTIFICATIONS_IMAGE, enableNotificationsViewController.screenImage.image)
        
        XCTAssertEqual("Enable notifications", enableNotificationsViewController.screenTitle.text)
        XCTAssertEqual("If you would like the app to send you workout reminders, you will need to enable notifications.", enableNotificationsViewController.screenDescription.text)
        
        XCTAssertEqual("Enable", enableNotificationsViewController.primaryButton.currentTitle!)
        XCTAssertEqual("No thanks", enableNotificationsViewController.secondaryButton.currentTitle!)
        XCTAssertTrue(enableNotificationsViewController.secondaryButton.isHidden)
    }
    
    func testPrimaryButtonTapped() {
        // Arrange/Act
        enableNotificationsViewController.primaryButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockEnableNotificationsPresenter.didTapEnableNotificationsCallCount)
    }
    
    func testSecondaryButtonTapped() {
        // Arrange/Act
        enableNotificationsViewController.secondaryButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockEnableNotificationsPresenter.didTapCloseCallCount)
    }

}
