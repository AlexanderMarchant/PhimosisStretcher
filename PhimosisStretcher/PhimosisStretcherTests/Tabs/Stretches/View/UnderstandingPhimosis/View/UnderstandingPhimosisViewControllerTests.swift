//
//  UnderstandingPhimosisViewControllerTests.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class UnderstandingPhimosisViewControllerTests: XCTestCase {
    
    var understandingPhimosisViewController: UnderstandingPhimosisViewController!
    var mockUnderstandingPhimosisPresenter: MockUnderstandingPhimosisPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUpWithError() throws {
        mockUnderstandingPhimosisPresenter = MockUnderstandingPhimosisPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        understandingPhimosisViewController = UnderstandingPhimosisViewController.instantiate(storyboard: "UnderstandingPhimosis")
        understandingPhimosisViewController.understandingPhimosisPresenter = mockUnderstandingPhimosisPresenter
        understandingPhimosisViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(understandingPhimosisViewController.view)
        
        mockUnderstandingPhimosisPresenter.resetCallCounts()
        mockAlertHandlerService.resetCallCounts()
    }

    override func tearDownWithError() throws {
        understandingPhimosisViewController = nil
        mockUnderstandingPhimosisPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        understandingPhimosisViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual(1, mockUnderstandingPhimosisPresenter.getInfoCallCount)
    }
    
    func testUnderstandingPhimosisPresenterView_DidGetInfo_NoImage() {
        // Arrange
        let UNDERSTANDING_PHIMOSIS = UnderstandingPhimosis(
            title: "Test",
            introduction: "Test",
            casuses: "Test",
            image: "",
            solutions: "Test",
            goodNews: "Test",
            references: [])
        
        let EXPECTED_REFERENCE_TEXT = "No references"
        
        // Act
        understandingPhimosisViewController.didGetInfo(UNDERSTANDING_PHIMOSIS)
        
        // Assert
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.title, understandingPhimosisViewController.title)
        XCTAssertNil(understandingPhimosisViewController.headerImage.image)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.title, understandingPhimosisViewController.headerTitle.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.introduction, understandingPhimosisViewController.introduction.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.casuses, understandingPhimosisViewController.casuses.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.solutions, understandingPhimosisViewController.solutions.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.goodNews, understandingPhimosisViewController.goodNews.text)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, understandingPhimosisViewController.references.text)
    }
    
    func testUnderstandingPhimosisPresenterView_DidGetInfo_NoReferences() {
        // Arrange
        let UNDERSTANDING_PHIMOSIS = UnderstandingPhimosis(
            title: "Test",
            introduction: "Test",
            casuses: "Test",
            image: "understanding-phimosis",
            solutions: "Test",
            goodNews: "Test",
            references: [])
        
        let EXPECTED_REFERENCE_TEXT = "No references"
        let EXPECTED_IMAGE = UIImage(named: "understanding-phimosis", in: Bundle(identifier: "PhimosisStretches"), compatibleWith: nil)!
        
        // Act
        understandingPhimosisViewController.didGetInfo(UNDERSTANDING_PHIMOSIS)
        
        // Assert
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.title, understandingPhimosisViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, understandingPhimosisViewController.headerImage.image)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.title, understandingPhimosisViewController.headerTitle.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.introduction, understandingPhimosisViewController.introduction.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.casuses, understandingPhimosisViewController.casuses.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.solutions, understandingPhimosisViewController.solutions.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.goodNews, understandingPhimosisViewController.goodNews.text)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, understandingPhimosisViewController.references.text)
    }
    
    func testUnderstandingPhimosisPresenterView_DidGetInfo_OneReference() {
        // Arrange
        let UNDERSTANDING_PHIMOSIS = UnderstandingPhimosis(
            title: "Test",
            introduction: "Test",
            casuses: "Test",
            image: "understanding-phimosis",
            solutions: "Test",
            goodNews: "Test",
            references: ["Test"])
        
        let EXPECTED_REFERENCE_TEXT = "Test"
        let EXPECTED_IMAGE = UIImage(named: "understanding-phimosis", in: Bundle(identifier: "PhimosisStretches"), compatibleWith: nil)!
        
        // Act
        understandingPhimosisViewController.didGetInfo(UNDERSTANDING_PHIMOSIS)
        
        // Assert
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.title, understandingPhimosisViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, understandingPhimosisViewController.headerImage.image)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.title, understandingPhimosisViewController.headerTitle.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.introduction, understandingPhimosisViewController.introduction.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.casuses, understandingPhimosisViewController.casuses.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.solutions, understandingPhimosisViewController.solutions.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.goodNews, understandingPhimosisViewController.goodNews.text)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, understandingPhimosisViewController.references.text)
    }
    
    func testUnderstandingPhimosisPresenterView_DidGetInfo_ManyReferences() {
        // Arrange
        let UNDERSTANDING_PHIMOSIS = UnderstandingPhimosis(
            title: "Test",
            introduction: "Test",
            casuses: "Test",
            image: "understanding-phimosis",
            solutions: "Test",
            goodNews: "Test",
            references: ["Test", "Test", "Test"])
        
        let EXPECTED_REFERENCE_TEXT = "Test\n \nTest\n \nTest"
        let EXPECTED_IMAGE = UIImage(named: "understanding-phimosis", in: Bundle(identifier: "PhimosisStretches"), compatibleWith: nil)!
        
        // Act
        understandingPhimosisViewController.didGetInfo(UNDERSTANDING_PHIMOSIS)
        
        // Assert
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.title, understandingPhimosisViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, understandingPhimosisViewController.headerImage.image)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.title, understandingPhimosisViewController.headerTitle.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.introduction, understandingPhimosisViewController.introduction.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.casuses, understandingPhimosisViewController.casuses.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.solutions, understandingPhimosisViewController.solutions.text)
        XCTAssertEqual(UNDERSTANDING_PHIMOSIS.goodNews, understandingPhimosisViewController.goodNews.text)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, understandingPhimosisViewController.references.text)
    }
}
