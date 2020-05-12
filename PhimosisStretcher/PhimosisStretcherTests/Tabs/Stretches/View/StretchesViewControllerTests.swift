//
//  StretchesViewControllerTests.swift
//  PhimosisStretcherTests
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
        stretchesViewController.stretchesPresenter = mockStretchesPresenter
        stretchesViewController.alertHandlerService = mockAlertHandlerService
        
        XCTAssertNotNil(stretchesViewController.view)
    }

    override func tearDownWithError() throws {
        stretchesViewController = nil
        mockStretchesPresenter = nil
        mockAlertHandlerService = nil
    }

}
