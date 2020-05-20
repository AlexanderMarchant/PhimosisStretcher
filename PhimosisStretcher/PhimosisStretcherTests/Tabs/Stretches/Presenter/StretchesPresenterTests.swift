//
//  StretechesPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class StretchesPresenterTests: XCTestCase {
    
    var stretchesPresenter: StretchesPresenter!
    var mockAdServerService: MockAdServerService!
    var mockUserDefaultsService: MockUserDefaultsService!
    var mockStretchesPresenterView: MockStretchesPresenterView!
    var mockStretchesPresenterDelegate: MockStretchesPresenterDelegate!

    override func setUpWithError() throws {
        mockAdServerService = MockAdServerService()
        mockUserDefaultsService = MockUserDefaultsService()
        mockStretchesPresenterView = MockStretchesPresenterView()
        mockStretchesPresenterDelegate = MockStretchesPresenterDelegate()
        
        stretchesPresenter = StretchesPresenter(
            mockAdServerService,
            mockUserDefaultsService,
            with: mockStretchesPresenterView,
            delegate: mockStretchesPresenterDelegate)
    }

    override func tearDownWithError() throws {
        stretchesPresenter = nil
        mockAdServerService = nil
        mockUserDefaultsService = nil
        mockStretchesPresenterView = nil
        mockStretchesPresenterDelegate = nil
    }
    
    func testDidSelectUnderstandingPhimosis() {
        // Arrange
        let understandingPhimosis = UnderstandingPhimosis(
            title: "Test",
            introduction: "Test",
            casuses: "Test",
            image: "Test",
            solutions: "Test",
            goodNews: "Test",
            references: ["Test"])
        
        // Act
        stretchesPresenter.didSelectUnderstandingPhimosis(understandingPhimosis)
        
        // Assert
        XCTAssertEqual(1, mockStretchesPresenterDelegate.didSelectUnderstandingPhimosisCallCount)
    }
    
    func testDidSelectSafetyMeasures() {
        // Arrange
        let safetyMeasures = SafetyMeasures(
            title: "Test",
            introduction: "Test",
            safetyTips: [SafetyTip(title: "Test", explanation: "Test")],
            image: "Test",
            references: ["Test"])
            
        // Act
        stretchesPresenter.didSelectSafetyMeasures(safetyMeasures)
        
        // Assert
        XCTAssertEqual(1, mockStretchesPresenterDelegate.didSelectSafetyMeasuresCallCount)
    }
    
    func testDidSelectStretch() {
        // Arrange
        let stretch = StretchInfo(
            title: "Test",
            stretchInfo: "Test",
            warning: "Test",
            image: "Test",
            steps: "Test",
            closingText: "Test",
            references: ["Test"])
            
        // Act
        stretchesPresenter.didSelectStretch(stretch)
        
        // Assert
        XCTAssertEqual(1, mockStretchesPresenterDelegate.didSelectStretchCallCount)
    }

}
