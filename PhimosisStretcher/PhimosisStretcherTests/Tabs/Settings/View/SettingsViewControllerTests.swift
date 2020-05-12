//
//  SettingsViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class SettingsViewControllerTests: XCTestCase {
    
    var settingsViewController: SettingsViewController!
    var mockSettingsPresenter: MockSettingsPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUpWithError() throws {
        mockSettingsPresenter = MockSettingsPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        settingsViewController = SettingsViewController.instantiate(storyboard: "Settings")
        settingsViewController.settingsPresenter = mockSettingsPresenter
        settingsViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(settingsViewController.view)
    }

    override func tearDownWithError() throws {
        settingsViewController = nil
        mockSettingsPresenter = nil
        mockAlertHandlerService = nil
    }

}
