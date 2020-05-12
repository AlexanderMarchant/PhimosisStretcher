//
//  StretchInfoPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class StretchInfoPresenterTests: XCTestCase {
    
    var stretchInfoPresenter: StretchInfoPresenter!
    var mockUserDefaultsService: MockUserDefaultsService!
    var mockStretchInfoPresenterView: MockStretchInfoPresenterView!
    var mockStretchInfoPresenterDelegate: MockStretchInfoPresenterDelegate!

    override func setUpWithError() throws {
        mockUserDefaultsService = MockUserDefaultsService()
        mockStretchInfoPresenterView = MockStretchInfoPresenterView()
        mockStretchInfoPresenterDelegate = MockStretchInfoPresenterDelegate()
        
        stretchInfoPresenter = StretchInfoPresenter(
            mockUserDefaultsService,
            with: mockStretchInfoPresenterView,
            delegate: mockStretchInfoPresenterDelegate)
    }

    override func tearDownWithError() throws {
        stretchInfoPresenter = nil
        mockUserDefaultsService = nil
        mockStretchInfoPresenterView = nil
        mockStretchInfoPresenterDelegate = nil
    }

}
