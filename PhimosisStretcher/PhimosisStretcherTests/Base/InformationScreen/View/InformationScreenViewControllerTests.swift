//
//  InformationScreenViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class InformationScreenViewControllerTests: XCTestCase {

    var informationScreenViewController: InformationScreenViewController!
    var mockInformationScreenPresenter: MockInformationScreenPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!
    
    override func setUp() {
        mockInformationScreenPresenter = MockInformationScreenPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        informationScreenViewController = InformationScreenViewController.instantiate(storyboard: "InformationScreen")
        
        informationScreenViewController.advertScreenPresenter = mockInformationScreenPresenter
        informationScreenViewController.informationScreenPresenter = mockInformationScreenPresenter
        
        XCTAssertNotNil(informationScreenViewController.view)
    }

    override func tearDown() {
        informationScreenViewController = nil
        mockInformationScreenPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange
        let LOST_IMAGE = UIImage(named: "lost", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        let CLOSE_IMAGE = UIImage(named: "close-icon", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!.withRenderingMode(.alwaysTemplate)
        
        // Act
        informationScreenViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual(LOST_IMAGE, informationScreenViewController.screenImage.image)
        
        XCTAssertEqual(Fonts.headerFont, informationScreenViewController.screenTitle.font)
        XCTAssertEqual(0, informationScreenViewController.screenTitle.numberOfLines)
        XCTAssertEqual(.byWordWrapping, informationScreenViewController.screenTitle.lineBreakMode)
        
        XCTAssertEqual(Fonts.textFont, informationScreenViewController.screenDescription.font)
        XCTAssertEqual(UIColor.textGray, informationScreenViewController.screenDescription.textColor)
        
        XCTAssertEqual(CLOSE_IMAGE, informationScreenViewController.closeButton.imageView?.image)
        XCTAssertEqual(UIColor.clear, informationScreenViewController.closeButton.backgroundColor)
        XCTAssertEqual(Fonts.buttonFont, informationScreenViewController.closeButton.titleLabel?.font)
        XCTAssertEqual(UIColor.textBlack, informationScreenViewController.closeButton.imageView?.tintColor)
        XCTAssertEqual(UIColor.textBlack, informationScreenViewController.closeButton.tintColor)
        
        let primaryButtonTarget = informationScreenViewController.primaryButton.allTargets.first(where: { $0.self is InformationScreenViewController })
        let primaryButtonTargetActionName = informationScreenViewController
            .primaryButton
            .actions(
                forTarget: primaryButtonTarget,
                forControlEvent: .touchUpInside)?
            .first!
        
        let secondaryButtonTarget = informationScreenViewController.secondaryButton.allTargets.first(where: { $0.self is InformationScreenViewController })
        let secondaryButtonTargetActionName = informationScreenViewController
            .secondaryButton
            .actions(
                forTarget: secondaryButtonTarget,
                forControlEvent: .touchUpInside)?
            .first!
            
        let closeButtonTarget = informationScreenViewController.closeButton.allTargets.first(where: { $0.self is InformationScreenViewController })
        let closeButtonTargetActionName = informationScreenViewController
            .closeButton
            .actions(
                forTarget: closeButtonTarget,
                forControlEvent: .touchUpInside)?
            .first!
        
        XCTAssertEqual("primaryButtonTapped", primaryButtonTargetActionName)
        XCTAssertEqual("secondaryButtonTapped", secondaryButtonTargetActionName)
        XCTAssertEqual("closeButtonTapped", closeButtonTargetActionName)
    }
    
    func testPrimaryButtonTapped() {
        // Arrange/Act/Assert
        expectFatalError(expectedMessage: "Must override 'primaryButtonTapped' method") {
            self.informationScreenViewController.primaryButtonTapped()
        }
    }
    
    func testSecondaryButtonTapped() {
        // Arrange/Act/Assert
        expectFatalError(expectedMessage: "Must override 'secondaryButtonTapped' method") {
            self.informationScreenViewController.secondaryButtonTapped()
        }
    }
    
    func testCloseButtonTapped() {
        // Arrange/Act
        informationScreenViewController.closeButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockInformationScreenPresenter.didTapCloseCallCount)
    }

}
