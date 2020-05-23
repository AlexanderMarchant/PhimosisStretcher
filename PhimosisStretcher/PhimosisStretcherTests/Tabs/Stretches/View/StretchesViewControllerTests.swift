//
//  StretchesViewControllerTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class StretchesViewControllerTests: XCTestCase {
    
    var stretchesViewController: StretchesViewController!
    var mockStretchesPresenter: MockStretchesPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUpWithError() throws {
        mockStretchesPresenter = MockStretchesPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        stretchesViewController = StretchesViewController.instantiate(storyboard: "Stretches")
        stretchesViewController.advertScreenPresenter = mockStretchesPresenter
        stretchesViewController.stretchesPresenter = mockStretchesPresenter
        stretchesViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(stretchesViewController.view)
    }

    override func tearDownWithError() throws {
        stretchesViewController = nil
        mockStretchesPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        stretchesViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual("Stretches", stretchesViewController.title)
    }
    
    func testNumberOfSections() {
        // Arrange/Act
        let result = stretchesViewController.numberOfSections(in: stretchesViewController.tableView)
        
        // Assert
        XCTAssertEqual(2, result)
    }
    
    func testNumberOfRowsInSection_Section_0() {
        // Arrange
        let SECTION = 0
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, numberOfRowsInSection: SECTION)
        
        // Assert
        XCTAssertEqual(2, result)
    }
    
    func testNumberOfRowsInSection_Section_1() {
        // Arrange
        let SECTION = 1
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, numberOfRowsInSection: SECTION)
        
        // Assert
        XCTAssertEqual(4, result)
    }
    
    func testNumberOfRowsInSection_Section_Other() {
        // Arrange
        let SECTION = 2
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, numberOfRowsInSection: SECTION)
        
        // Assert
        XCTAssertEqual(0, result)
    }
    
    func testHeightForHeaderInSection() {
        // Arrange/Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, heightForHeaderInSection: 0)
        
        // Assert
        XCTAssertEqual(30, result)
    }
    
    func testTitleForHeaderInSection_Section_0() {
        // Arrange
        let SECTION = 0
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, titleForHeaderInSection: SECTION)
        
        // Assert
        XCTAssertEqual("Important Information", result)
    }
    
    func testTitleForHeaderInSection_Section_1() {
        // Arrange
        let SECTION = 1
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, titleForHeaderInSection: SECTION)
        
        // Assert
        XCTAssertEqual("Stretches", result)
    }
    
    func testTitleForHeaderInSection_Section_Other() {
        // Arrange
        let SECTION = 2
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, titleForHeaderInSection: SECTION)
        
        // Assert
        XCTAssertNil(result)
    }
    
    func testCellForRowAt_UnderstandingPhimosisCell() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 0, section: 0)
        
        let UNDERSTANDING_PHIMOSIS = UnderstandingPhimosis(
            title: "Test",
            introduction: "Test",
            casuses: "Test",
            image: "understanding-phimosis",
            solutions: "Test",
            goodNews: "Test",
            references: ["Test"])
        
        let IMAGE = UIImage(named: "understanding-phimosis", in: Bundle(identifier: "PhimosisStretches"), compatibleWith: nil)!
        
        stretchesViewController.understandingPhimosis = UNDERSTANDING_PHIMOSIS
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, cellForRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertTrue(result is StretchCell)
        
        let convertedCell = result as! StretchCell
        
        XCTAssertEqual(IMAGE, convertedCell.stretchImage.image)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.title, convertedCell.stretchTitle.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.introduction, convertedCell.previewText.text)
    }
    
    func testCellForRowAt_SafetyMeasuresCell() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 1, section: 0)
        
        let SAFETY_MEASURES = SafetyMeasures(
            title: "Test",
            introduction: "Test",
            safetyTips: [SafetyTip(title: "Test", explanation: "Test")],
            image: "safety",
            references: ["Test"])
        
        let IMAGE = UIImage(named: "safety", in: Bundle(identifier: "PhimosisStretches"), compatibleWith: nil)!
        
        stretchesViewController.safetyMeasures = SAFETY_MEASURES
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, cellForRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertTrue(result is StretchCell)
        
        let convertedCell = result as! StretchCell
        
        XCTAssertEqual(IMAGE, convertedCell.stretchImage.image)
        XCTAssertEqual(SAFETY_MEASURES.title, convertedCell.stretchTitle.text)
        XCTAssertEqual(SAFETY_MEASURES.introduction, convertedCell.previewText.text)
    }
    
    func testCellForRowAt_StretchCell() {
        let INDEX_PATH = IndexPath(row: 0, section: 1)
        
        let STRETCH = StretchInfo(
            title: "Test",
            stretchInfo: "Test",
            warning: "Test",
            image: "two-finger-inside-stretching",
            steps: "Test",
            closingText: "Test",
            references: ["Test"])
        
        let IMAGE = UIImage(named: "two-finger-inside-stretching", in: Bundle(identifier: "PhimosisStretches"), compatibleWith: nil)!
        
        stretchesViewController.stretches = [STRETCH]
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, cellForRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertTrue(result is StretchCell)
        
        let convertedCell = result as! StretchCell
        
        XCTAssertEqual(IMAGE, convertedCell.stretchImage.image)
        XCTAssertEqual(STRETCH.title, convertedCell.stretchTitle.text)
        XCTAssertEqual(STRETCH.stretchInfo, convertedCell.previewText.text)
    }
    
    func testCellForRowAt_Other() {
        let INDEX_PATH = IndexPath(row: 2, section: 0)
        
        // Act
        let result = stretchesViewController.tableView(stretchesViewController.tableView, cellForRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertTrue(result is StretchCell)
        
        let convertedCell = result as! StretchCell
        
        XCTAssertNil(convertedCell.stretchImage.image)
        XCTAssertEqual("Not found", convertedCell.stretchTitle.text)
        XCTAssertEqual("Not found", convertedCell.previewText.text)
    }
    
    func testDidSelectRowAt_UnderstandingPhimosis() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 0, section: 0)
        
        // Act
        stretchesViewController.tableView(stretchesViewController.tableView, didSelectRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertEqual(1, mockStretchesPresenter.didSelectUnderstandingPhimosisCallCount)
        XCTAssertEqual(0, mockStretchesPresenter.didSelectSafetyMeasuresCallCount)
        XCTAssertEqual(0, mockStretchesPresenter.didSelectStretchCallCount)
    }
    
    func testDidSelectRowAt_SafetyMeasures() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 1, section: 0)
        
        // Act
        stretchesViewController.tableView(stretchesViewController.tableView, didSelectRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertEqual(0, mockStretchesPresenter.didSelectUnderstandingPhimosisCallCount)
        XCTAssertEqual(1, mockStretchesPresenter.didSelectSafetyMeasuresCallCount)
        XCTAssertEqual(0, mockStretchesPresenter.didSelectStretchCallCount)
    }
    
    func testDidSelectRowAt_Stretch() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 1, section: 1)
        
        // Act
        stretchesViewController.tableView(stretchesViewController.tableView, didSelectRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertEqual(0, mockStretchesPresenter.didSelectUnderstandingPhimosisCallCount)
        XCTAssertEqual(0, mockStretchesPresenter.didSelectSafetyMeasuresCallCount)
        XCTAssertEqual(1, mockStretchesPresenter.didSelectStretchCallCount)
    }
    
    func testDidSelectRowAt_Section_0_Other() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 3, section: 0)
        
        // Act
        stretchesViewController.tableView(stretchesViewController.tableView, didSelectRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertEqual(0, mockStretchesPresenter.didSelectUnderstandingPhimosisCallCount)
        XCTAssertEqual(0, mockStretchesPresenter.didSelectSafetyMeasuresCallCount)
        XCTAssertEqual(0, mockStretchesPresenter.didSelectStretchCallCount)
    }
    
    func testDidSelectRowAt_Other() {
        // Arrange
        let INDEX_PATH = IndexPath(row: 0, section: 2)
        
        // Act
        stretchesViewController.tableView(stretchesViewController.tableView, didSelectRowAt: INDEX_PATH)
        
        // Assert
        XCTAssertEqual(0, mockStretchesPresenter.didSelectUnderstandingPhimosisCallCount)
        XCTAssertEqual(0, mockStretchesPresenter.didSelectSafetyMeasuresCallCount)
        XCTAssertEqual(0, mockStretchesPresenter.didSelectStretchCallCount)
    }

}
