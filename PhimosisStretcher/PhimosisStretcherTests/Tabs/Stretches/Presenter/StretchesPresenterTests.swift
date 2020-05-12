//
//  StretechesPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class StretchesPresenterTests: XCTestCase {
    
    var stretchesPresenter: StretchesPresenter!
    var mockUserDefaultsService: MockUserDefaultsService!
    var mockStretchesPresenterView: MockStretchesPresenterView!
    var mockStretchesPresenterDelegate: MockStretchesPresenterDelegate!

    override func setUpWithError() throws {
        mockUserDefaultsService = MockUserDefaultsService()
        mockStretchesPresenterView = MockStretchesPresenterView()
        mockStretchesPresenterDelegate = MockStretchesPresenterDelegate()
        
        stretchesPresenter = StretchesPresenter(
            mockUserDefaultsService,
            with: mockStretchesPresenterView,
            delegate: mockStretchesPresenterDelegate)
    }

    override func tearDownWithError() throws {
        stretchesPresenter = nil
        mockUserDefaultsService = nil
        mockStretchesPresenterView = nil
        mockStretchesPresenterDelegate = nil
    }

}
