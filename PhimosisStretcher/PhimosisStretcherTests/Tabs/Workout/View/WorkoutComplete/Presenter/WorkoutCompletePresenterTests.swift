//
//  WorkoutCompletePresenterTests.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 14/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import XCTest
@testable import PhimosisStretcher

class WorkoutCompletePresenterTests: XCTestCase {

    var workoutCompletePresenter: WorkoutCompletePresenter!
    var mockAdServerService: MockAdServerService!
    var mockUserDefaultsService: MockUserDefaultsService!
    var mockWorkoutCompletePresenterView: MockWorkoutCompletePresenterView!
    var mockWorkoutCompletePresenterDelegate: MockWorkoutCompletePresenterDelegate!

    override func setUp() {
        mockAdServerService = MockAdServerService()
        mockUserDefaultsService = MockUserDefaultsService()
        mockWorkoutCompletePresenterView = MockWorkoutCompletePresenterView()
        mockWorkoutCompletePresenterDelegate = MockWorkoutCompletePresenterDelegate()
        
        workoutCompletePresenter = WorkoutCompletePresenter(
            mockAdServerService,
            mockUserDefaultsService,
            with: mockWorkoutCompletePresenterView,
            delegate: mockWorkoutCompletePresenterDelegate)
    }

    override func tearDown() {
        workoutCompletePresenter = nil
        mockAdServerService = nil
        mockUserDefaultsService = nil
        mockWorkoutCompletePresenterView = nil
        mockWorkoutCompletePresenterDelegate = nil
    }
    
    func testUpdateWorkoutsToday() {
        // Arrange
        mockUserDefaultsService.getIntValueReturnValue = 1
        
        // Act
        workoutCompletePresenter.updateWorkoutsToday()
        
        // Assert
        XCTAssertEqual(1, mockUserDefaultsService.getIntValueCallCount)
        XCTAssertEqual(1, mockUserDefaultsService.setIntValueCallCount)
        XCTAssertEqual(2, Int(mockUserDefaultsService.setIntValue))
    }
}
