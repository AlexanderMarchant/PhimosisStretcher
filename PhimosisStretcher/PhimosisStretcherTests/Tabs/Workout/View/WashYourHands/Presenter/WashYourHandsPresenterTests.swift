//
//  WashYourHandsPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class WashYourHandsPresenterTests: XCTestCase {

    var washYourHandsPresenter: WashYourHandsPresenter!
    var mockAdServerService: MockAdServerService!
    var mockUserDefaultsService: MockUserDefaultsService!
    var mockWashYourHandsPresenterView: MockWashYourHandsPresenterView!
    var mockWashYourHandsPresenterDelegate: MockWashYourHandsPresenterDelegate!

    override func setUp() {
        mockAdServerService = MockAdServerService()
        mockUserDefaultsService = MockUserDefaultsService()
        mockWashYourHandsPresenterView = MockWashYourHandsPresenterView()
        mockWashYourHandsPresenterDelegate = MockWashYourHandsPresenterDelegate()
        
        washYourHandsPresenter = WashYourHandsPresenter(
            mockAdServerService,
            with: mockWashYourHandsPresenterView,
            delegate: mockWashYourHandsPresenterDelegate)
    }

    override func tearDown() {
        washYourHandsPresenter = nil
        mockAdServerService = nil
        mockUserDefaultsService = nil
        mockWashYourHandsPresenterView = nil
        mockWashYourHandsPresenterDelegate = nil
    }
    
    func testDidTapContinue() {
        // Arrange/Act
        washYourHandsPresenter.didTapContinue()
        
        // Assert
        XCTAssertEqual(1, mockWashYourHandsPresenterDelegate.didTapContinueCallCount)
    }
}
