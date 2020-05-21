//
//  SafetyMeasuresViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class SafetyMeasuresViewControllerTests: XCTestCase {
    
    var safetyMeasuresViewController: SafetyMeasuresViewController!
    var mockSafetyMeasuresPresenter: MockSafetyMeasuresPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUpWithError() throws {
        mockSafetyMeasuresPresenter = MockSafetyMeasuresPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        safetyMeasuresViewController = SafetyMeasuresViewController.instantiate(storyboard: "SafetyMeasures")
        safetyMeasuresViewController.safetyMeasuresPresenter = mockSafetyMeasuresPresenter
        safetyMeasuresViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(safetyMeasuresViewController.view)
        
        mockSafetyMeasuresPresenter.resetCallCounts()
        mockAlertHandlerService.resetCallCounts()
    }

    override func tearDownWithError() throws {
        safetyMeasuresViewController = nil
        mockSafetyMeasuresPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange/Act
        safetyMeasuresViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual(1, mockSafetyMeasuresPresenter.getSafetyMeasuresCallCount)
    }
    
    func testSafetyMeasuresPresenterView_DidGetSafetyMeasures_NoImage() {
        // Arrange
        let SAFETY_MEASURES = SafetyMeasures(
            title: "Test",
            introduction: "Test",
            safetyTips: [],
            image: "",
            references: [])
        
        let EXPECTED_REFERENCE_TEXT = "No references"
        
        let attrs = [NSAttributedString.Key.font : Fonts.semiBoldTextFont]
        let EXPECTED_SAFETY_TIPS_TEXT = NSMutableAttributedString(string: "", attributes: attrs)
        
        // Act
        safetyMeasuresViewController.didGetSafetyMeasures(SAFETY_MEASURES)
        
        // Assert
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.title)
        XCTAssertNil(safetyMeasuresViewController.headerImage.image)
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.headerTitle.text)
        XCTAssertEqual(SAFETY_MEASURES.introduction, safetyMeasuresViewController.introduction.text)
        XCTAssertEqual(EXPECTED_SAFETY_TIPS_TEXT, safetyMeasuresViewController.safetyMeasures.attributedText)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, safetyMeasuresViewController.references.text)
    }
    
    func testSafetyMeasuresPresenterView_DidGetSafetyMeasures_NoTips() {
        // Arrange
        let SAFETY_MEASURES = SafetyMeasures(
            title: "Test",
            introduction: "Test",
            safetyTips: [],
            image: "safety",
            references: [])
        
        let EXPECTED_IMAGE = UIImage(named: "safety", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        let EXPECTED_REFERENCE_TEXT = "No references"
        
        let attrs = [NSAttributedString.Key.font : Fonts.semiBoldTextFont]
        let EXPECTED_SAFETY_TIPS_TEXT = NSMutableAttributedString(string: "", attributes: attrs)
        
        // Act
        safetyMeasuresViewController.didGetSafetyMeasures(SAFETY_MEASURES)
        
        // Assert
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, safetyMeasuresViewController.headerImage.image)
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.headerTitle.text)
        XCTAssertEqual(SAFETY_MEASURES.introduction, safetyMeasuresViewController.introduction.text)
        XCTAssertEqual(EXPECTED_SAFETY_TIPS_TEXT, safetyMeasuresViewController.safetyMeasures.attributedText)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, safetyMeasuresViewController.references.text)
    }
    
    func testSafetyMeasuresPresenterView_DidGetSafetyMeasures_OneTip() {
        // Arrange
        let SAFETY_MEASURES = SafetyMeasures(
            title: "Test",
            introduction: "Test",
            safetyTips: [SafetyTip(title: "Test1", explanation: "Test1")],
            image: "safety",
            references: [])
        
        let EXPECTED_IMAGE = UIImage(named: "safety", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        let EXPECTED_REFERENCE_TEXT = "No references"
        
        let attrs = [NSAttributedString.Key.font : Fonts.semiBoldTextFont]
        let EXPECTED_SAFETY_TIPS_TEXT = NSMutableAttributedString(string: "", attributes: attrs)
        
        let safetyTip1Title = NSMutableAttributedString(string: "Test1", attributes: attrs)
        let safetyTip1Description = NSMutableAttributedString(string: "\n\nTest1")
        
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip1Title)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip1Description)
        
        // Act
        safetyMeasuresViewController.didGetSafetyMeasures(SAFETY_MEASURES)
        
        // Assert
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, safetyMeasuresViewController.headerImage.image)
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.headerTitle.text)
        XCTAssertEqual(SAFETY_MEASURES.introduction, safetyMeasuresViewController.introduction.text)
        XCTAssertEqual(EXPECTED_SAFETY_TIPS_TEXT, safetyMeasuresViewController.safetyMeasures.attributedText)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, safetyMeasuresViewController.references.text)
    }
    
    func testSafetyMeasuresPresenterView_DidGetSafetyMeasures_ManyTips() {
        // Arrange
        let SAFETY_MEASURES = SafetyMeasures(
            title: "Test",
            introduction: "Test",
            safetyTips: [SafetyTip(title: "Test1", explanation: "Test1"), SafetyTip(title: "Test2", explanation: "Test2")],
            image: "safety",
            references: [])
        
        let EXPECTED_IMAGE = UIImage(named: "safety", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        let EXPECTED_REFERENCE_TEXT = "No references"
        
        let attrs = [NSAttributedString.Key.font : Fonts.semiBoldTextFont]
        let EXPECTED_SAFETY_TIPS_TEXT = NSMutableAttributedString(string: "", attributes: attrs)
        
        let safetyTip1Title = NSMutableAttributedString(string: "Test1", attributes: attrs)
        let safetyTip1Description = NSMutableAttributedString(string: "\n\nTest1")
        
        let safetyTip2Title = NSMutableAttributedString(string: "\n\n\nTest2", attributes: attrs)
        let safetyTip2Description = NSMutableAttributedString(string: "\n\nTest2")
        
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip1Title)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip1Description)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip2Title)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip2Description)
        
        // Act
        safetyMeasuresViewController.didGetSafetyMeasures(SAFETY_MEASURES)
        
        // Assert
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, safetyMeasuresViewController.headerImage.image)
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.headerTitle.text)
        XCTAssertEqual(SAFETY_MEASURES.introduction, safetyMeasuresViewController.introduction.text)
        XCTAssertEqual(EXPECTED_SAFETY_TIPS_TEXT, safetyMeasuresViewController.safetyMeasures.attributedText)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, safetyMeasuresViewController.references.text)
    }
    
    func testSafetyMeasuresPresenterView_DidGetSafetyMeasures_OneReference() {
        // Arrange
        let SAFETY_MEASURES = SafetyMeasures(
            title: "Test",
            introduction: "Test",
            safetyTips: [SafetyTip(title: "Test1", explanation: "Test1"), SafetyTip(title: "Test2", explanation: "Test2")],
            image: "safety",
            references: ["Test"])
        
        let EXPECTED_IMAGE = UIImage(named: "safety", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        let EXPECTED_REFERENCE_TEXT = "Test"
        
        let attrs = [NSAttributedString.Key.font : Fonts.semiBoldTextFont]
        let EXPECTED_SAFETY_TIPS_TEXT = NSMutableAttributedString(string: "", attributes: attrs)
        
        let safetyTip1Title = NSMutableAttributedString(string: "Test1", attributes: attrs)
        let safetyTip1Description = NSMutableAttributedString(string: "\n\nTest1")
        
        let safetyTip2Title = NSMutableAttributedString(string: "\n\n\nTest2", attributes: attrs)
        let safetyTip2Description = NSMutableAttributedString(string: "\n\nTest2")
        
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip1Title)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip1Description)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip2Title)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip2Description)
        
        // Act
        safetyMeasuresViewController.didGetSafetyMeasures(SAFETY_MEASURES)
        
        // Assert
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, safetyMeasuresViewController.headerImage.image)
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.headerTitle.text)
        XCTAssertEqual(SAFETY_MEASURES.introduction, safetyMeasuresViewController.introduction.text)
        XCTAssertEqual(EXPECTED_SAFETY_TIPS_TEXT, safetyMeasuresViewController.safetyMeasures.attributedText)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, safetyMeasuresViewController.references.text)
    }
    
    func testSafetyMeasuresPresenterView_DidGetSafetyMeasures_ManyReferences() {
        // Arrange
        let SAFETY_MEASURES = SafetyMeasures(
            title: "Test",
            introduction: "Test",
            safetyTips: [SafetyTip(title: "Test1", explanation: "Test1"), SafetyTip(title: "Test2", explanation: "Test2")],
            image: "safety",
            references: ["Test", "Test", "Test"])
        
        let EXPECTED_IMAGE = UIImage(named: "safety", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        let EXPECTED_REFERENCE_TEXT = "Test\n \nTest\n \nTest"
        
        let attrs = [NSAttributedString.Key.font : Fonts.semiBoldTextFont]
        let EXPECTED_SAFETY_TIPS_TEXT = NSMutableAttributedString(string: "", attributes: attrs)
        
        let safetyTip1Title = NSMutableAttributedString(string: "Test1", attributes: attrs)
        let safetyTip1Description = NSMutableAttributedString(string: "\n\nTest1")
        
        let safetyTip2Title = NSMutableAttributedString(string: "\n\n\nTest2", attributes: attrs)
        let safetyTip2Description = NSMutableAttributedString(string: "\n\nTest2")
        
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip1Title)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip1Description)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip2Title)
        EXPECTED_SAFETY_TIPS_TEXT.append(safetyTip2Description)
        
        // Act
        safetyMeasuresViewController.didGetSafetyMeasures(SAFETY_MEASURES)
        
        // Assert
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.title)
        XCTAssertEqual(EXPECTED_IMAGE, safetyMeasuresViewController.headerImage.image)
        XCTAssertEqual(SAFETY_MEASURES.title, safetyMeasuresViewController.headerTitle.text)
        XCTAssertEqual(SAFETY_MEASURES.introduction, safetyMeasuresViewController.introduction.text)
        XCTAssertEqual(EXPECTED_SAFETY_TIPS_TEXT, safetyMeasuresViewController.safetyMeasures.attributedText)
        XCTAssertEqual(EXPECTED_REFERENCE_TEXT, safetyMeasuresViewController.references.text)
    }

}
