//
//  SettingsPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class SettingsPresenterTests: XCTestCase {
    
    var settingsPresenter: SettingsPresenter!
    var mockUserDefaultsService: MockUserDefaultsService!
    var mockSettingsPresenterView: MockSettingsPresenterView!
    var mockSettingsPresenterDelegate: MockSettingsPresenterDelegate!

    override func setUpWithError() throws {
        mockUserDefaultsService = MockUserDefaultsService()
        mockSettingsPresenterView = MockSettingsPresenterView()
        mockSettingsPresenterDelegate = MockSettingsPresenterDelegate()
        
        settingsPresenter = SettingsPresenter(
            mockUserDefaultsService,
            with: mockSettingsPresenterView,
            delegate: mockSettingsPresenterDelegate)
    }

    override func tearDownWithError() throws {
        settingsPresenter = nil
        mockUserDefaultsService = nil
        mockSettingsPresenterView = nil
        mockSettingsPresenterDelegate = nil
    }

}
