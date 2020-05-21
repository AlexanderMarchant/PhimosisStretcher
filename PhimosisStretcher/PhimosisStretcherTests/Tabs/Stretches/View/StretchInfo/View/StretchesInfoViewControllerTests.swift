//
//  StretchesInfoViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class StretchesInfoViewControllerTests: XCTestCase {
    
    var stretchInfoViewController: StretchInfoViewController!
    var mockStretchInfoPresenter: MockStretchInfoPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUpWithError() throws {
        mockStretchInfoPresenter = MockStretchInfoPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        stretchInfoViewController = StretchInfoViewController.instantiate(storyboard: "StretchInfo")
        stretchInfoViewController.stretchInfoPresenter = mockStretchInfoPresenter
        stretchInfoViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(stretchInfoViewController.view)
        
        mockStretchInfoPresenter.resetCallCounts()
        mockAlertHandlerService.resetCallCounts()
    }

    override func tearDownWithError() throws {
        stretchInfoViewController = nil
        mockStretchInfoPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        stretchInfoViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual(1, mockStretchInfoPresenter.getStretchInfoCallCount)
    }
    
    func testStretchInfoPresenterView_DidGetStretchInfo_NoImage() {
        // Arrange
        let STRETCH_INFO = StretchInfo(
            title: "Test",
            stretchInfo: "Test",
            warning: "Test",
            image: "",
            steps: "Test",
            closingText: "Test",
            references: [])
        
        let EXPECTED_REFERENCE_TEXT = "No references"
        
        // Act
        stretchInfoViewController.didGetStretchInfo(STRETCH_INFO)
        
        // Assert
        XCTAssertEqual(STRETCH_INFO.title, stretchInfoViewController.title)
        XCTAssertNil(stretchInfoViewController.stretchImage.image)
        XCTAssertEqual(STRETCH_INFO.title, stretchInfoViewController.stretchTitle.text)
        XCTAssertEqual(STRETCH_INFO.stretchInfo, stretchInfoViewController.stretchInfo.text)
        XCTAssertEqual(STRETCH_INFO.warning, stretchInfoViewController.warning.text)
        XCTAssertEqual(STRETCH_INFO.steps, stretchInfoViewController.steps.text)
        XCTAssertEqual(STRETCH_INFO.closingText, stretchInfoViewController.closingText.text)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, stretchInfoViewController.references.text)
    }
    
    func testStretchInfoPresenterView_DidGetStretchInfo_NoReferences() {
        // Arrange
        let STRETCH_INFO = StretchInfo(
            title: "Test",
            stretchInfo: "Test",
            warning: "Test",
            image: "two-finger-inside-stretching",
            steps: "Test",
            closingText: "Test",
            references: [])
        
        let EXPECTED_IMAGE = UIImage(named: "two-finger-inside-stretching", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        let EXPECTED_REFERENCE_TEXT = "No references"
        
        // Act
        stretchInfoViewController.didGetStretchInfo(STRETCH_INFO)
        
        // Assert
        XCTAssertEqual(STRETCH_INFO.title, stretchInfoViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, stretchInfoViewController.stretchImage.image)
        XCTAssertEqual(STRETCH_INFO.title, stretchInfoViewController.stretchTitle.text)
        XCTAssertEqual(STRETCH_INFO.stretchInfo, stretchInfoViewController.stretchInfo.text)
        XCTAssertEqual(STRETCH_INFO.warning, stretchInfoViewController.warning.text)
        XCTAssertEqual(STRETCH_INFO.steps, stretchInfoViewController.steps.text)
        XCTAssertEqual(STRETCH_INFO.closingText, stretchInfoViewController.closingText.text)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, stretchInfoViewController.references.text)
    }
    
    func testStretchInfoPresenterView_DidGetStretchInfo_OneReference() {
        // Arrange
        let STRETCH_INFO = StretchInfo(
            title: "Test",
            stretchInfo: "Test",
            warning: "Test",
            image: "two-finger-inside-stretching",
            steps: "Test",
            closingText: "Test",
            references: ["Test"])
        
        let EXPECTED_IMAGE = UIImage(named: "two-finger-inside-stretching", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        let EXPECTED_REFERENCE_TEXT = "Test"
        
        // Act
        stretchInfoViewController.didGetStretchInfo(STRETCH_INFO)
        
        // Assert
        XCTAssertEqual(STRETCH_INFO.title, stretchInfoViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, stretchInfoViewController.stretchImage.image)
        XCTAssertEqual(STRETCH_INFO.title, stretchInfoViewController.stretchTitle.text)
        XCTAssertEqual(STRETCH_INFO.stretchInfo, stretchInfoViewController.stretchInfo.text)
        XCTAssertEqual(STRETCH_INFO.warning, stretchInfoViewController.warning.text)
        XCTAssertEqual(STRETCH_INFO.steps, stretchInfoViewController.steps.text)
        XCTAssertEqual(STRETCH_INFO.closingText, stretchInfoViewController.closingText.text)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, stretchInfoViewController.references.text)
    }
    
    func testStretchInfoPresenterView_DidGetStretchInfo_ManyReferences() {
        // Arrange
        let STRETCH_INFO = StretchInfo(
            title: "Test",
            stretchInfo: "Test",
            warning: "Test",
            image: "two-finger-inside-stretching",
            steps: "Test",
            closingText: "Test",
            references: ["Test", "Test", "Test"])
        
        let EXPECTED_IMAGE = UIImage(named: "two-finger-inside-stretching", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        let EXPECTED_REFERENCE_TEXT = "Test\n \nTest\n \nTest"
        
        // Act
        stretchInfoViewController.didGetStretchInfo(STRETCH_INFO)
        
        // Assert
        XCTAssertEqual(STRETCH_INFO.title, stretchInfoViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, stretchInfoViewController.stretchImage.image)
        XCTAssertEqual(STRETCH_INFO.title, stretchInfoViewController.stretchTitle.text)
        XCTAssertEqual(STRETCH_INFO.stretchInfo, stretchInfoViewController.stretchInfo.text)
        XCTAssertEqual(STRETCH_INFO.warning, stretchInfoViewController.warning.text)
        XCTAssertEqual(STRETCH_INFO.steps, stretchInfoViewController.steps.text)
        XCTAssertEqual(STRETCH_INFO.closingText, stretchInfoViewController.closingText.text)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, stretchInfoViewController.references.text)
    }

}
