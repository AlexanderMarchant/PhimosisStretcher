//
//  EnableNotificationsPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class EnableNotificationsPresenterTests: XCTestCase {

    var enableNotificationsPresenter: EnableNotificationsPresenter!
    var mockAdServerService: MockAdServerService!
    var mockEnableNotificationsPresenterView: MockEnableNotificationsPresenterView!
    var mockEnableNotificationsPresenterDelegate: MockEnableNotificationsPresenterDelegate!

    override func setUp() {
        mockAdServerService = MockAdServerService()
        mockEnableNotificationsPresenterView = MockEnableNotificationsPresenterView()
        mockEnableNotificationsPresenterDelegate = MockEnableNotificationsPresenterDelegate()
        
        enableNotificationsPresenter = EnableNotificationsPresenter(
            mockAdServerService,
            with: mockEnableNotificationsPresenterView,
            delegate: mockEnableNotificationsPresenterDelegate)
    }

    override func tearDown() {
        enableNotificationsPresenter = nil
        mockAdServerService = nil
        mockEnableNotificationsPresenterView = nil
        mockEnableNotificationsPresenterDelegate = nil
    }
    
    func testDidTapEnableNotifications() {
        // Arrange/Act/Assert
        enableNotificationsPresenter.didTapEnableNotifications()
    }

}
