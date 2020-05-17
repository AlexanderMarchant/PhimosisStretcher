//
//  RemindersPresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 17/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class RemindersPresenterTests: XCTestCase {
    
    var remindersPresenter: RemindersPresenter!
    var mockRemindersPresenterView: MockRemindersPresenterView!
    var mockRemindersPresenterDelegate: MockRemindersPresenterDelegate!

    override func setUpWithError() throws {
        mockRemindersPresenterView = MockRemindersPresenterView()
        mockRemindersPresenterDelegate = MockRemindersPresenterDelegate()
        
        remindersPresenter = RemindersPresenter(
            with: mockRemindersPresenterView,
            delegate: mockRemindersPresenterDelegate)
    }

    override func tearDownWithError() throws {
        remindersPresenter = nil
        mockRemindersPresenterView = nil
        mockRemindersPresenterDelegate = nil
    }

}
