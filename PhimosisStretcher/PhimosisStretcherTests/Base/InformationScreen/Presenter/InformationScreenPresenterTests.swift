//
//  InformationScreenPresenterTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class InformationScreenPresenterTests: XCTestCase {
    
    var informationScreenPresenter: InformationScreenPresenter!
    var mockAdServerService: MockAdServerService!
    var mockInformationScreenPresenterView: MockInformationScreenPresenterView!
    var mockInformationScreenPresenterDelegate: MockInformationScreenPresenterDelegate!

    override func setUp() {
        mockAdServerService = MockAdServerService()
        mockInformationScreenPresenterView = MockInformationScreenPresenterView()
        mockInformationScreenPresenterDelegate = MockInformationScreenPresenterDelegate()
        
        informationScreenPresenter = InformationScreenPresenter(
            mockAdServerService,
            with: mockInformationScreenPresenterView,
            delegate: mockInformationScreenPresenterDelegate)
    }

    override func tearDown() {
        informationScreenPresenter = nil
        mockAdServerService = nil
        mockInformationScreenPresenterView = nil
        mockInformationScreenPresenterDelegate = nil
    }
    
    func testDidTapClose() {
        // Arrange/Act
        informationScreenPresenter.didTapClose()
        
        // Assert
        XCTAssertEqual(1, mockInformationScreenPresenterDelegate.didTapCloseCallCount)
    }

}
