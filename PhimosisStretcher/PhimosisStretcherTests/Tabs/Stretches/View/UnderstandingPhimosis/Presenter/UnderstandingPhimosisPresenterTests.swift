//
//  UnderstandingPhimosisPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class UnderstandingPhimosisPresenterTests: XCTestCase {
    
    var understandingPhimosisPresenter: UnderstandingPhimosisPresenter!
    var understandingPhimosis: UnderstandingPhimosis!
    var mockUnderstandingPhimosisPresenterView: MockUnderstandingPhimosisPresenterView!
    var mockUnderstandingPhimosisPresenterDelegate: MockUnderstandingPhimosisPresenterDelegate!

    override func setUpWithError() throws {
        understandingPhimosis = UnderstandingPhimosis(
            title: "Test",
            introduction: "Test",
            casuses: "Test",
            image: "understanding-phimosis",
            solutions: "Test",
            goodNews: "Test",
            references: ["Test"])
        
        mockUnderstandingPhimosisPresenterView = MockUnderstandingPhimosisPresenterView()
        mockUnderstandingPhimosisPresenterDelegate = MockUnderstandingPhimosisPresenterDelegate()
        
        understandingPhimosisPresenter = UnderstandingPhimosisPresenter(
            understandingPhimosis,
            with: mockUnderstandingPhimosisPresenterView,
            delegate: mockUnderstandingPhimosisPresenterDelegate)
    }

    override func tearDownWithError() throws {
        understandingPhimosisPresenter = nil
        understandingPhimosis = nil
        mockUnderstandingPhimosisPresenterView = nil
        mockUnderstandingPhimosisPresenterDelegate = nil
    }
    
    func testGetInfo() {
        // Arrange/Act
        understandingPhimosisPresenter.getInfo()
        
        // Assert
        XCTAssertEqual(1, mockUnderstandingPhimosisPresenterView.didGetInfoCallCount)
    }

}
