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
    var stretchInfo: StretchInfo!
    var mockStretchInfoPresenterView: MockStretchInfoPresenterView!
    var mockStretchInfoPresenterDelegate: MockStretchInfoPresenterDelegate!

    override func setUpWithError() throws {
        stretchInfo = StretchInfo(
            title: "Test",
            stretchInfo: "Test",
            warning: "Test",
            image: "Test",
            steps: "Test",
            closingText: "Test",
            references: ["Test", "Test"])
        
        mockStretchInfoPresenterView = MockStretchInfoPresenterView()
        mockStretchInfoPresenterDelegate = MockStretchInfoPresenterDelegate()
        
        stretchInfoPresenter = StretchInfoPresenter(
            stretchInfo,
            with: mockStretchInfoPresenterView,
            delegate: mockStretchInfoPresenterDelegate)
    }

    override func tearDownWithError() throws {
        stretchInfoPresenter = nil
        stretchInfo = nil
        mockStretchInfoPresenterView = nil
        mockStretchInfoPresenterDelegate = nil
    }

}
