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
    }

    override func tearDownWithError() throws {
        stretchInfoViewController = nil
        mockStretchInfoPresenter = nil
        mockAlertHandlerService = nil
    }

}
