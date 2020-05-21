//
//  WashYourHandsViewControllerTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 21/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class WashYourHandsViewControllerTests: XCTestCase {

    var washYourHandsViewController: WashYourHandsViewController!
    var mockWashYourHandsPresenter: MockWashYourHandsPresenter!
    var mockAlertHandlerService: MockAlertHandlerService!

    override func setUp(){
        mockWashYourHandsPresenter = MockWashYourHandsPresenter()
        mockAlertHandlerService = MockAlertHandlerService()
        
        washYourHandsViewController = WashYourHandsViewController.instantiate(storyboard: "WashYourHands")
        
        washYourHandsViewController.advertScreenPresenter = mockWashYourHandsPresenter
        washYourHandsViewController.informationScreenPresenter = mockWashYourHandsPresenter
        washYourHandsViewController.washYourHandsPresenter = mockWashYourHandsPresenter
        washYourHandsViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(washYourHandsViewController.view)
        
        mockWashYourHandsPresenter.resetCallCounts()
    }

    override func tearDown() {
        washYourHandsViewController = nil
        mockWashYourHandsPresenter = nil
        mockAlertHandlerService = nil
    }
    
    func testViewDidLoad() {
        // Arrange
        let ENABLE_NOTIFICATIONS_IMAGE = UIImage(named: "handwashing", in: Bundle(identifier: "PhimosisStretcher"), compatibleWith: nil)!
        
        // Act
        washYourHandsViewController.viewDidLoad()
        
        // Assert
        XCTAssertEqual(ENABLE_NOTIFICATIONS_IMAGE, washYourHandsViewController.screenImage.image)
        
        XCTAssertEqual("Wash Your Hands", washYourHandsViewController.screenTitle.text)
        XCTAssertEqual("Make sure you have washed your hands before continuing with the workout, otherwise, you may cause a foreskin infection leading to a halt/reversion of your progress.", washYourHandsViewController.screenDescription.text)
        
        XCTAssertEqual("Continue", washYourHandsViewController.primaryButton.currentTitle!)
        XCTAssertEqual("All Done", washYourHandsViewController.secondaryButton.currentTitle!)
        XCTAssertTrue(washYourHandsViewController.secondaryButton.isHidden)
        XCTAssertFalse(washYourHandsViewController.secondaryButton.isEnabled)
    }
    
    func testPrimaryButtonTapped() {
        // Arrange/Act
        washYourHandsViewController.primaryButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockWashYourHandsPresenter.didTapContinueCallCount)
    }
    
    func testSecondaryButtonTapped() {
        // Arrange/Act
        washYourHandsViewController.secondaryButtonTapped()
        
        // Assert
        XCTAssertEqual(1, mockWashYourHandsPresenter.didTapContinueCallCount)
    }

}
