//
//  SafetyMeasuresPresenterTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class SafetyMeasuresPresenterTests: XCTestCase {
    
    var safetyMeasuresPresenter: SafetyMeasuresPresenter!
    var safetyMeasures: SafetyMeasures!
    var mockSafetyMeasuresPresenterView: MockSafetyMeasuresPresenterView!
    var mockSafetyMeasuresPresenterDelegate: MockSafetyMeasuresPresenterDelegate!

    override func setUpWithError() throws {
        safetyMeasures = SafetyMeasures(
            title: "Test",
            introduction: "Test",
            safetyTips: [SafetyTip(title: "Test", explanation: "Test")],
            image: "safety",
            references: ["Test"])
        
        mockSafetyMeasuresPresenterView = MockSafetyMeasuresPresenterView()
        mockSafetyMeasuresPresenterDelegate = MockSafetyMeasuresPresenterDelegate()
        
        safetyMeasuresPresenter = SafetyMeasuresPresenter(
            safetyMeasures,
            with: mockSafetyMeasuresPresenterView,
            delegate: mockSafetyMeasuresPresenterDelegate)
    }

    override func tearDownWithError() throws {
        safetyMeasuresPresenter = nil
        safetyMeasures = nil
        mockSafetyMeasuresPresenterView = nil
        mockSafetyMeasuresPresenterDelegate = nil
    }
    
    func testGetInfo() {
        // Arrange/Act
        safetyMeasuresPresenter.getSafetyMeasures()
        
        // Assert
        XCTAssertEqual(1, mockSafetyMeasuresPresenterView.didGetSafetyMeasuresCallCount)
    }

}
